; DESCRIPTION: Creates a magenta circular shape at (146, 124) with radius 79.
; PLAN: r0=146(x), r1=124(y), r2=79(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 124
LDI r2, 79
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
