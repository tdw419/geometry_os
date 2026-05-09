; DESCRIPTION: Renders a green box of size 36x62 starting at (250, 49).
; PLAN: r0=250(x), r1=49(y), r2=36(width), r3=62(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 49
LDI r2, 36
LDI r3, 62
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
