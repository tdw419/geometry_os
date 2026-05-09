; DESCRIPTION: Draws a yellow circle centered at (146, 196) with radius 22.
; PLAN: r0=146(x), r1=196(y), r2=22(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 196
LDI r2, 22
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
