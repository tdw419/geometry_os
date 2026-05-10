; DESCRIPTION: Draws a yellow circle centered at (264, 187) with radius 65.
; PLAN: r0=264(x), r1=187(y), r2=65(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 264
LDI r1, 187
LDI r2, 65
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
