; DESCRIPTION: Draws a yellow circle centered at (127, 126) with radius 75.
; PLAN: r0=127(x), r1=126(y), r2=75(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 127
LDI r1, 126
LDI r2, 75
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
