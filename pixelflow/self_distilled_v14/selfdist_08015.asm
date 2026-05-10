; DESCRIPTION: Places a magenta disk with center (85, 33) and radius 21.
; PLAN: r0=85(x), r1=33(y), r2=21(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 85
LDI r1, 33
LDI r2, 21
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
