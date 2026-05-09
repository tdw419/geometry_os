; DESCRIPTION: Draws a cyan circle centered at (231, 30) with radius 16.
; PLAN: r0=231(x), r1=30(y), r2=16(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 231
LDI r1, 30
LDI r2, 16
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
