; DESCRIPTION: Renders a blue box of size 88x96 starting at (9, 42).
; PLAN: r0=9(x), r1=42(y), r2=88(width), r3=96(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 42
LDI r2, 88
LDI r3, 96
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
