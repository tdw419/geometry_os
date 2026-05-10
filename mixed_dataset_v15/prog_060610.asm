; DESCRIPTION: Renders a green box of size 24x34 starting at (84, 90).
; PLAN: r0=84(x), r1=90(y), r2=24(width), r3=34(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 90
LDI r2, 24
LDI r3, 34
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
