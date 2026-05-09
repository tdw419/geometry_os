; DESCRIPTION: Renders a blue box of size 38x62 starting at (122, 54).
; PLAN: r0=122(x), r1=54(y), r2=38(width), r3=62(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 54
LDI r2, 38
LDI r3, 62
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
