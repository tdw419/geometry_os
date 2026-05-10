; DESCRIPTION: Draws a magenta cross in the center of the screen (horizontal + vertical lines). radius 15.
; PLAN: r0=0(x), r1=17(y), r2=15(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 0
LDI r1, 17
LDI r2, 15
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
