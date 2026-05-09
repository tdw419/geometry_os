; DESCRIPTION: Draws a yellow circle centered at (95, 167) with radius 80.
; PLAN: r0=95(x), r1=167(y), r2=80(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 95
LDI r1, 167
LDI r2, 80
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
