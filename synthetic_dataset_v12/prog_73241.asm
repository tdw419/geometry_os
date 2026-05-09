; DESCRIPTION: Draws a green circle centered at (301, 87) with radius 70.
; PLAN: r0=301(x), r1=87(y), r2=70(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 301
LDI r1, 87
LDI r2, 70
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
