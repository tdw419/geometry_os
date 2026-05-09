; DESCRIPTION: Draws a red circle centered at (226, 180) with radius 24.
; PLAN: r0=226(x), r1=180(y), r2=24(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 226
LDI r1, 180
LDI r2, 24
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
