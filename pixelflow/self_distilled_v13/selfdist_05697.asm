; DESCRIPTION: Places a magenta disk with center (308, 92) and radius 55.
; PLAN: r0=308(x), r1=92(y), r2=55(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 308
LDI r1, 92
LDI r2, 55
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
