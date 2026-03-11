;; Simple Counter in WebAssembly Text Format
;; Demonstrates basic loops and arithmetic operations
;;
;; Counts from 0 to n-1, stores values in memory

(module
  ;; Export a function that counts up to n and returns the sum
  (func (export "count_sum") (param $n i32) (result i32)
    (local $sum i32)
    (local $i i32)

    ;; Initialize sum = 0
    (local.set $sum (i32.const 0))

    ;; Loop from 0 to n-1
    (local.set $i (i32.const 0))
    (block $break
      (loop $continue
        ;; Break if i >= n
        (br_if $break (i32.ge_s (local.get $i) (local.get $n)))

        ;; Add i to sum
        (local.set $sum (i32.add (local.get $sum) (local.get $i)))

        ;; Increment counter
        (local.set $i (i32.add (local.get $i) (i32.const 1)))

        ;; Continue loop
        (br $continue)
      )
    )

    ;; Return sum (should equal n*(n-1)/2)
    (local.get $sum)
  )

  ;; Export a function that stores counter values in memory
  (func (export "count_to_memory") (param $n i32)
    (local $i i32)

    ;; Loop and store each counter value
    (local.set $i (i32.const 0))
    (block $break
      (loop $continue
        (br_if $break (i32.ge_s (local.get $i) (local.get $n)))

        ;; Store i at memory offset i*4
        (i32.store
          (i32.mul (local.get $i) (i32.const 4))
          (local.get $i)
        )

        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $continue)
      )
    )
  )

  ;; Export test function: sum of 0-9 = 45
  (func (export "test_sum10") (result i32)
    (call 0 (i32.const 10))
  )

  ;; Memory (2 pages = 128KB)
  (memory (export "memory") 2)

  ;; Get memory size
  (func (export "get_memory_size") (result i32)
    (memory.size)
  )
)
