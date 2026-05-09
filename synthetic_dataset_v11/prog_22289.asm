; DESCRIPTION: Creates a magenta circular shape at (236, 240) with radius 16.
; PLAN: r0=236(x), r1=240(y), r2=16(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 236
LDI r1, 240
LDI r2, 16
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
