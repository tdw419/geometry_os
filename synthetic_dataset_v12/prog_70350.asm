; DESCRIPTION: Renders a blue box of size 34x88 starting at (388, 120).
; PLAN: r0=388(x), r1=120(y), r2=34(width), r3=88(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 120
LDI r2, 34
LDI r3, 88
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
