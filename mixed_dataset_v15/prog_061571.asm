; DESCRIPTION: Renders a green box of size 83x26 starting at (216, 95).
; PLAN: r0=216(x), r1=95(y), r2=83(width), r3=26(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 95
LDI r2, 83
LDI r3, 26
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
