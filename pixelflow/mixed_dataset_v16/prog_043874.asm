; DESCRIPTION: Draws a magenta circle centered at (470, 168) with radius 18.
; PLAN: r0=470(x), r1=168(y), r2=18(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 470
LDI r1, 168
LDI r2, 18
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
