; DESCRIPTION: Draws a blue circle centered at (167, 127) with radius 27.
; PLAN: r0=167(x), r1=127(y), r2=27(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 167
LDI r1, 127
LDI r2, 27
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
