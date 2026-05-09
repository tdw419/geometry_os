; DESCRIPTION: Renders a purple box of size 12x12 starting at (414, 131).
; PLAN: r0=414(x), r1=131(y), r2=12(width), r3=12(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 131
LDI r2, 12
LDI r3, 12
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
