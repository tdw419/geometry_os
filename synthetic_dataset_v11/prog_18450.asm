; DESCRIPTION: Places a magenta circle of radius 79 at center (96, 128).
; PLAN: r0=96(x), r1=128(y), r2=79(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 96
LDI r1, 128
LDI r2, 79
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
