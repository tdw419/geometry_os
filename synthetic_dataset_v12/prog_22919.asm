; DESCRIPTION: Places a magenta circle of radius 79 at center (282, 152).
; PLAN: r0=282(x), r1=152(y), r2=79(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 282
LDI r1, 152
LDI r2, 79
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
