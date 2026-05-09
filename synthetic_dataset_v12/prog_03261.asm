; DESCRIPTION: Renders a blue box of size 59x62 starting at (27, 119).
; PLAN: r0=27(x), r1=119(y), r2=59(width), r3=62(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 119
LDI r2, 59
LDI r3, 62
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
