; DESCRIPTION: Creates a magenta circular shape at (108, 65) with radius 13.
; PLAN: r0=108(x), r1=65(y), r2=13(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 108
LDI r1, 65
LDI r2, 13
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
