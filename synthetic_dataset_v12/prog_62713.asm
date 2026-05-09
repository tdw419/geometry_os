; DESCRIPTION: Creates a magenta circular shape at (272, 77) with radius 59.
; PLAN: r0=272(x), r1=77(y), r2=59(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 272
LDI r1, 77
LDI r2, 59
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
