; DESCRIPTION: Draws a magenta circle centered at (445, 135) with radius 13.
; PLAN: r0=445(x), r1=135(y), r2=13(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 445
LDI r1, 135
LDI r2, 13
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
