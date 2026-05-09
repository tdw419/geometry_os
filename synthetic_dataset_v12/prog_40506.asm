; DESCRIPTION: Places a magenta circle of radius 64 at center (363, 86).
; PLAN: r0=363(x), r1=86(y), r2=64(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 363
LDI r1, 86
LDI r2, 64
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
