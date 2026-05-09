; DESCRIPTION: Renders a blue box of size 56x62 starting at (30, 166).
; PLAN: r0=30(x), r1=166(y), r2=56(width), r3=62(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 166
LDI r2, 56
LDI r3, 62
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
