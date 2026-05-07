; DESCRIPTION: The GeOS assembly code initializes several registers and enters an infinite loop (`main_0`) where it performs a subtraction operation between `r7` and `r8` with the immediate value `0x35D94C`, compares `r2` and `r13` against the immediate value `0xBA8CFE`, then calls the `FRAME` subroutine, and finally jumps back to the start of the loop.

; drawing loop program
; initialization
  LDI r14, 2977
  LDI r9, 0
  LDI r6, 0x1C97BB
  LDI r11, 2
main_0:
  SUBI r7, r8, 0x35D94C
  CMPI r2, r13, 0xBA8CFE
  FRAME
  JMP main_0
