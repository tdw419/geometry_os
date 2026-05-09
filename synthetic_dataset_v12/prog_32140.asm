; DESCRIPTION: Draws a yellow circle centered at (416, 135) with radius 68.
; PLAN: r0=416(x), r1=135(y), r2=68(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 416
LDI r1, 135
LDI r2, 68
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
