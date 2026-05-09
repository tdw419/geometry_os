; DESCRIPTION: Renders a blue box of size 62x50 starting at (140, 73).
; PLAN: r0=140(x), r1=73(y), r2=62(width), r3=50(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 73
LDI r2, 62
LDI r3, 50
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
