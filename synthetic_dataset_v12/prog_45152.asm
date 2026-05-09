; DESCRIPTION: Draws a green circle centered at (352, 164) with radius 54.
; PLAN: r0=352(x), r1=164(y), r2=54(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 352
LDI r1, 164
LDI r2, 54
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
