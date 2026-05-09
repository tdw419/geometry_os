; DESCRIPTION: Draws a red circle centered at (161, 146) with radius 74.
; PLAN: r0=161(x), r1=146(y), r2=74(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 161
LDI r1, 146
LDI r2, 74
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
