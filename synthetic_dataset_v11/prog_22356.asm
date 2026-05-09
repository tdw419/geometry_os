; DESCRIPTION: Places a cyan circle of radius 16 at center (84, 231).
; PLAN: r0=84(x), r1=231(y), r2=16(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 231
LDI r2, 16
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
