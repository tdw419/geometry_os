; DESCRIPTION: Creates a magenta circular shape at (146, 99) with radius 69.
; PLAN: r0=146(x), r1=99(y), r2=69(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 99
LDI r2, 69
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
