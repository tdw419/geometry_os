; DESCRIPTION: Creates a magenta circular shape at (385, 220) with radius 26.
; PLAN: r0=385(x), r1=220(y), r2=26(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 385
LDI r1, 220
LDI r2, 26
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
