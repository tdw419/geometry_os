; DESCRIPTION: The GeOS assembly code initializes registers `r6` and `r12` with specific values. It then enters a loop where it adds the value of `r6` to `r7`, stores the result in `r13`, subtracts 50 from `r11`, and updates the frame pointer before jumping back to the start of the loop.

; drawing loop program
; initialization
  LDI r6, 2926
  LDI r12, 0xB5C777
main_0:
  ADD r13, r7, r6
  SUBI r4, r11, 50
  FRAME
  JMP main_0
