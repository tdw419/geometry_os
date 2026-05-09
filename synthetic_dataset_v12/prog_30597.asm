; DESCRIPTION: Draws a yellow circle centered at (344, 164) with radius 68.
; PLAN: r0=344(x), r1=164(y), r2=68(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 344
LDI r1, 164
LDI r2, 68
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
