; DESCRIPTION: Creates a magenta circular shape at (428, 149) with radius 79.
; PLAN: r0=428(x), r1=149(y), r2=79(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 428
LDI r1, 149
LDI r2, 79
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
