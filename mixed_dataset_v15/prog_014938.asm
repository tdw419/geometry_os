; DESCRIPTION: Places a magenta disk with center (328, 36) and radius 79.
; PLAN: r0=328(x), r1=36(y), r2=79(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 328
LDI r1, 36
LDI r2, 79
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
