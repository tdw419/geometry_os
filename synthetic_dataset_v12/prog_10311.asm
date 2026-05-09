; DESCRIPTION: Renders a red box of size 62x119 starting at (220, 4).
; PLAN: r0=220(x), r1=4(y), r2=62(width), r3=119(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 4
LDI r2, 62
LDI r3, 119
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
