; DESCRIPTION: Renders a blue box of size 50x11 starting at (99, 95).
; PLAN: r0=99(x), r1=95(y), r2=50(width), r3=11(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 95
LDI r2, 50
LDI r3, 11
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
