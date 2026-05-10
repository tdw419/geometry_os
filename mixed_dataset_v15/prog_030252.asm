; DESCRIPTION: Draws a yellow circle centered at (208, 90) with radius 70.
; PLAN: r0=208(x), r1=90(y), r2=70(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 208
LDI r1, 90
LDI r2, 70
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
