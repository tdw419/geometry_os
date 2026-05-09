; DESCRIPTION: Renders a blue box of size 12x112 starting at (153, 32).
; PLAN: r0=153(x), r1=32(y), r2=12(width), r3=112(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 32
LDI r2, 12
LDI r3, 112
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
