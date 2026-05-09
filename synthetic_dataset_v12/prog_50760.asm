; DESCRIPTION: Draws a red circle centered at (455, 73) with radius 27.
; PLAN: r0=455(x), r1=73(y), r2=27(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 455
LDI r1, 73
LDI r2, 27
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
