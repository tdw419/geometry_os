; DESCRIPTION: Draws a red circle centered at (444, 214) with radius 25.
; PLAN: r0=444(x), r1=214(y), r2=25(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 444
LDI r1, 214
LDI r2, 25
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
