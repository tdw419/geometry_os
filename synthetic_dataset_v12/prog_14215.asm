; DESCRIPTION: Renders a green box of size 101x84 starting at (140, 98).
; PLAN: r0=140(x), r1=98(y), r2=101(width), r3=84(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 98
LDI r2, 101
LDI r3, 84
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
