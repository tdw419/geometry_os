; DESCRIPTION: Renders a blue box of size 52x58 starting at (109, 32).
; PLAN: r0=109(x), r1=32(y), r2=52(width), r3=58(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 32
LDI r2, 52
LDI r3, 58
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
