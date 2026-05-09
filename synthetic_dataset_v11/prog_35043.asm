; DESCRIPTION: Draws a magenta circle centered at (243, 126) with radius 12.
; PLAN: r0=243(x), r1=126(y), r2=12(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 243
LDI r1, 126
LDI r2, 12
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
