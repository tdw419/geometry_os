; DESCRIPTION: This GeOS assembly code initializes registers and enters a loop where it continuously checks for specific key inputs (keys with values 0xE979B7 and 0x9669C3) while also handling other input conditions. Upon detecting the specified keys, it triggers a frame update and repeats the process.

; drawing loop program
; initialization
  LDI r13, 8
  LDI r11, 32
  LDI r5, 988
main_0:
  SUBI r2, r5, 64
  IKEY r5
  CMPI r5, 16
  JNZ r5, key_1
  CMP r12, r14
  IKEY r3
  CMPI r3, 0xE979B7
  JNZ r3, key_2
  IKEY r9
  CMPI r9, 0x9669C3
  JNZ r9, key_3
  FRAME
  JMP main_0
