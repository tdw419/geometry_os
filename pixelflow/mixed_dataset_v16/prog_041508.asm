; DESCRIPTION: Places a magenta circle of radius 72 at center (414, 160).
; PLAN: r0=414(x), r1=160(y), r2=72(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 414
LDI r1, 160
LDI r2, 72
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
