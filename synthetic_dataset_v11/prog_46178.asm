; DESCRIPTION: Draws a magenta circle centered at (188, 190) with radius 48.
; PLAN: r0=188(x), r1=190(y), r2=48(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 188
LDI r1, 190
LDI r2, 48
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
