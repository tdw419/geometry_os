; DESCRIPTION: Draws a yellow circle centered at (70, 109) with radius 68.
; PLAN: r0=70(x), r1=109(y), r2=68(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 70
LDI r1, 109
LDI r2, 68
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
