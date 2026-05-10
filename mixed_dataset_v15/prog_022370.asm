; DESCRIPTION: Creates a green circular shape at (339, 231) with radius 12.
; PLAN: r0=339(x), r1=231(y), r2=12(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 339
LDI r1, 231
LDI r2, 12
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
