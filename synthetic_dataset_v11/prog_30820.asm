; DESCRIPTION: Draws a cyan circle centered at (94, 231) with radius 13.
; PLAN: r0=94(x), r1=231(y), r2=13(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 94
LDI r1, 231
LDI r2, 13
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
