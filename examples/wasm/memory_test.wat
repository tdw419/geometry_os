;; Memory Test in WebAssembly Text Format
;; Tests memory allocation, reading, and writing
;;
;; Operations:
;; - Write pattern to memory
;; - Read back and verify
;; - Test memory bounds

(module
  ;; Write a pattern to memory
  (func (export "write_pattern") (param $offset i32) (param $count i32)
    (local $i i32)

    (local.set $i (i32.const 0))
    (block $break
      (loop $continue
        (br_if $break (i32.ge_s (local.get $i) (local.get $count)))

        ;; Write pattern: 0x01, 0x02, 0x03, 0x04, ...
        (i32.store8
          (i32.add (local.get $offset) (local.get $i))
          (i32.add (i32.const 1) (local.get $i))
        )

        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $continue)
      )
    )
  )

  ;; Verify pattern in memory
  (func (export "verify_pattern") (param $offset i32) (param $count i32) (result i32)
    (local $i i32)
    (local $errors i32)

    (local.set $errors (i32.const 0))
    (local.set $i (i32.const 0))
    (block $break
      (loop $continue
        (br_if $break (i32.ge_s (local.get $i) (local.get $count)))

        ;; Read value
        (local.set $temp (i32.load8_u
          (i32.add (local.get $offset) (local.get $i))
        ))

        ;; Check if matches expected pattern
        (if (i32.ne (local.get $temp) (i32.add (i32.const 1) (local.get $i)))
          (then
            (local.set $errors (i32.add (local.get $errors) (i32.const 1)))
          )
        )

        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $continue)
      )
    )

    ;; Return error count (0 = success)
    (local.get $errors)
  )

  ;; Fill memory with a specific value
  (func (export "fill_memory") (param $value i32) (param $count i32)
    (local $i i32)

    (local.set $i (i32.const 0))
    (block $break
      (loop $continue
        (br_if $break (i32.ge_s (local.get $i) (local.get $count)))

        (i32.store
          (i32.mul (local.get $i) (i32.const 4))
          (local.get $value)
        )

        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $continue)
      )
    )
  )

  ;; Compute checksum of memory region
  (func (export "checksum") (param $offset i32) (param $count i32) (result i32)
    (local $i i32)
    (local $sum i32)

    (local.set $sum (i32.const 0))
    (local.set $i (i32.const 0))
    (block $break
      (loop $continue
        (br_if $break (i32.ge_s (local.get $i) (local.get $count)))

        (local.set $sum (i32.add (local.get $sum)
          (i32.load8_u (i32.add (local.get $offset) (local.get $i)))
        ))

        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $continue)
      )
    )

    (local.get $sum)
  )

  ;; Test memory at various offsets
  (func (export "test_offsets") (result i32)
    ;; Write to offset 0
    (i32.store (i32.const 0) (i32.const 0xDEADBEEF))
    ;; Write to offset 1024
    (i32.store (i32.const 1024) (i32.const 0xCAFEBABE))
    ;; Write to offset 4096
    (i32.store (i32.const 4096) (i32.const 0xFEEDFACE))

    ;; Return sum of all values
    (i32.add
      (i32.add
        (i32.load (i32.const 0))
        (i32.load (i32.const 1024))
      )
      (i32.load (i32.const 4096))
    )
  )

  ;; Memory (4 pages = 256KB)
  (memory (export "memory") 4)

  ;; Grow memory
  (func (export "grow_memory") (param $pages i32) (result i32)
    (memory.grow (local.get $pages))
  )

  ;; Get current memory size
  (func (export "get_memory_size") (result i32)
    (memory.size)
  )
)
