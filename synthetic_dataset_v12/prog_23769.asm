; DESCRIPTION: Renders a blue box of size 63x96 starting at (72, 148).
; PLAN: r0=72(x), r1=148(y), r2=63(width), r3=96(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 148
LDI r2, 63
LDI r3, 96
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
