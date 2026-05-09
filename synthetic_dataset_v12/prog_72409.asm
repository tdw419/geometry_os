; DESCRIPTION: Places a magenta circle of radius 11 at center (46, 32).
; PLAN: r0=46(x), r1=32(y), r2=11(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 46
LDI r1, 32
LDI r2, 11
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
