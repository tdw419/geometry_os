; DESCRIPTION: Draws a magenta circle centered at (460, 67) with radius 50.
; PLAN: r0=460(x), r1=67(y), r2=50(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 460
LDI r1, 67
LDI r2, 50
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
