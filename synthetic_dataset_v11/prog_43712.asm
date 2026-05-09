; DESCRIPTION: Renders a blue box of size 47x112 starting at (64, 22).
; PLAN: r0=64(x), r1=22(y), r2=47(width), r3=112(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 22
LDI r2, 47
LDI r3, 112
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
