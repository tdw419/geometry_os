; DESCRIPTION: Creates a magenta circular shape at (416, 194) with radius 60.
; PLAN: r0=416(x), r1=194(y), r2=60(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 416
LDI r1, 194
LDI r2, 60
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
