; DESCRIPTION: Draws a green circle centered at (393, 83) with radius 68.
; PLAN: r0=393(x), r1=83(y), r2=68(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 393
LDI r1, 83
LDI r2, 68
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
