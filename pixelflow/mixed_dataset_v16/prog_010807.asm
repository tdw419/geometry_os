; DESCRIPTION: Places a blue circle of radius 12 at center (117, 231).
; PLAN: r0=117(x), r1=231(y), r2=12(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 117
LDI r1, 231
LDI r2, 12
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
