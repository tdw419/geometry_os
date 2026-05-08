; DESCRIPTION: The GeOS assembly code initializes several registers with specific values and enters a loop where it continuously reads two keys (`r11` and `r15`). If the first key (`r11`) equals 32, it reads another key (`r15`). If this second key equals 256, it calls a function to draw a frame. The code then loops back to read keys again.

; drawing loop program
; initialization
  LDI r2, 10
  LDI r14, 128
  LDI r5, 0xA9EF7A
  LDI r10, 8
  LDI r6, 1573
main_0:
  SHR r9, r5, r11
  SHL r12, r1, r3
  IKEY r11
  CMPI r11, 32
  JNZ r11, key_1
  IKEY r15
  CMPI r15, 256
  JNZ r15, key_2
  FRAME
  JMP main_0
