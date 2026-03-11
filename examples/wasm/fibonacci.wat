;; Fibonacci Calculator in WebAssembly Text Format
;; Computes the nth Fibonacci number using iteration
;;
;; Expected results:
;;   fibonacci(10) = 55
;;   fibonacci(20) = 6765
;;   fibonacci(30) = 832040

(module
  ;; Export the main fibonacci function
  (func (export "fibonacci") (param $n i32) (result i32)
    (local $a i32)
    (local $b i32)
    (local $temp i32)
    (local $i i32)

    ;; Initialize: a = 0, b = 1
    (local.set $a (i32.const 0))
    (local.set $b (i32.const 1))

    ;; Handle edge cases
    (if (i32.le_s (local.get $n) (i32.const 0))
      (then (return (i32.const 0)))
    )
    (if (i32.eq (local.get $n) (i32.const 1))
      (then (return (i32.const 1)))
    )

    ;; Loop from 2 to n
    (local.set $i (i32.const 2))
    (block $break
      (loop $continue
        ;; Break if i > n
        (br_if $break (i32.gt_s (local.get $i) (local.get $n)))

        ;; Compute next Fibonacci: temp = a + b
        (local.set $temp (i32.add (local.get $a) (local.get $b)))

        ;; Shift: a = b, b = temp
        (local.set $a (local.get $b))
        (local.set $b (local.get $temp))

        ;; Increment counter
        (local.set $i (i32.add (local.get $i) (i32.const 1)))

        ;; Continue loop
        (br $continue)
      )
    )

    ;; Return result (stored in b)
    (local.get $b)
  )

  ;; Export a test function that returns the 10th Fibonacci number
  (func (export "test_fib10") (result i32)
    (call 0 (i32.const 10))  ;; Call fibonacci with n=10
  )

  ;; Export a test function that returns the 20th Fibonacci number
  (func (export "test_fib20") (result i32)
    (call 0 (i32.const 20))  ;; Call fibonacci with n=20
  )

  ;; Memory declaration (1 page = 64KB)
  (memory (export "memory") 1)

  ;; Export memory size function
  (func (export "get_memory_size") (result i32)
    (memory.size)
  )

  ;; Export a function to write result to memory
  (func (export "write_result") (param $value i32) (param $offset i32)
    (local.get $offset)
    (local.get $value)
    (i32.store)
  )

  ;; Export a function to read from memory
  (func (export "read_memory") (param $offset i32) (result i32)
    (local.get $offset)
    (i32.load)
  )
)
