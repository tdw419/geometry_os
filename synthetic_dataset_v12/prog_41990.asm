; DESCRIPTION: Draws a black circle centered at (344, 180) with radius 25.
; PLAN: r0=344(x), r1=180(y), r2=25(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 344
LDI r1, 180
LDI r2, 25
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
