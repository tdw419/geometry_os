; DESCRIPTION: Draws a blue circle centered at (231, 169) with radius 16.
; PLAN: r0=231(x), r1=169(y), r2=16(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 231
LDI r1, 169
LDI r2, 16
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
