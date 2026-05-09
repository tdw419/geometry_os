; DESCRIPTION: Creates a magenta circular shape at (80, 146) with radius 79.
; PLAN: r0=80(x), r1=146(y), r2=79(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 80
LDI r1, 146
LDI r2, 79
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
