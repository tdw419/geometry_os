; DESCRIPTION: Draws a red circle centered at (193, 167) with radius 27.
; PLAN: r0=193(x), r1=167(y), r2=27(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 193
LDI r1, 167
LDI r2, 27
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
