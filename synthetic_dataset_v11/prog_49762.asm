; DESCRIPTION: Renders a blue box of size 43x49 starting at (40, 48).
; PLAN: r0=40(x), r1=48(y), r2=43(width), r3=49(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 48
LDI r2, 43
LDI r3, 49
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
