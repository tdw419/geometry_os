; DESCRIPTION: Draws a magenta circle centered at (168, 171) with radius 70.
; PLAN: r0=168(x), r1=171(y), r2=70(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 168
LDI r1, 171
LDI r2, 70
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
