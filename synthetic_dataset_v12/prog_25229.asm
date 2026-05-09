; DESCRIPTION: Draws a green circle centered at (231, 57) with radius 25.
; PLAN: r0=231(x), r1=57(y), r2=25(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 231
LDI r1, 57
LDI r2, 25
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
