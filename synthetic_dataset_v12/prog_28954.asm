; DESCRIPTION: Renders a green box of size 12x34 starting at (119, 24).
; PLAN: r0=119(x), r1=24(y), r2=12(width), r3=34(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 24
LDI r2, 12
LDI r3, 34
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
