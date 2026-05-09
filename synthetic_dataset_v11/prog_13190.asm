; DESCRIPTION: Renders a blue box of size 96x49 starting at (30, 90).
; PLAN: r0=30(x), r1=90(y), r2=96(width), r3=49(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 90
LDI r2, 96
LDI r3, 49
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
