; DESCRIPTION: Places a blue circle of radius 42 at center (414, 106).
; PLAN: r0=414(x), r1=106(y), r2=42(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 414
LDI r1, 106
LDI r2, 42
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
