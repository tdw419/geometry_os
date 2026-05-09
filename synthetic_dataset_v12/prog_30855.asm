; DESCRIPTION: Creates a magenta circular shape at (371, 79) with radius 72.
; PLAN: r0=371(x), r1=79(y), r2=72(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 371
LDI r1, 79
LDI r2, 72
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
