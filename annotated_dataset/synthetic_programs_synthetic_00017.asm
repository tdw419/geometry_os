; DESCRIPTION: The GeOS assembly code initializes registers `r9` and `r3` with specific values. It then enters a loop (`main_0`) where it compares register `r14` against the value `0xAFE8F3`, shifts right the contents of register `r12` by the value in `r3`, saves the frame pointer, and jumps back to the start of the loop.

; input driven program
; initialization
  LDI r9, 3516
  LDI r3, 0xF42002
main_0:
  CMPI r14, 0xAFE8F3
  SHR r15, r12, r3
  FRAME
  JMP main_0
