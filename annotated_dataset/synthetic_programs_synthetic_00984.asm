; DESCRIPTION: This GeOS assembly code initializes registers and enters a loop where it waits for specific key inputs. Upon receiving the first key input (value `0x857745`), it sets two pixels on the screen with specified colors. If a different key input (`58`) is received, it calls the `FRAME` function to update the display and returns to the main loop.

; drawing loop program
; initialization
  LDI r14, 0x10451E
  LDI r6, 3853
main_0:
  XOR r7, r6, r10
  AND r6, r22, r8
  IKEY r10
  CMPI r10, 0x857745
  JNZ r10, key_1
  LDI r7, 16
  LDI r7, 2344
  LDI r19, 0xA72D8A
  PSET r7, r7, r19
  LDI r6, 3959
  LDI r15, 2573
  LDI r14, 0x8207AB
  PSET r6, r15, r14
  IKEY r5
  CMPI r5, 58
  JNZ r5, key_2
  FRAME
  JMP main_0
