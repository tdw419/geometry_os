; DESCRIPTION: Draws a red circle centered at (113, 146) with radius 40.
; PLAN: r0=113(x), r1=146(y), r2=40(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 113
LDI r1, 146
LDI r2, 40
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
