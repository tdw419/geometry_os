; DESCRIPTION: Renders a green box of size 85x26 starting at (118, 40).
; PLAN: r0=118(x), r1=40(y), r2=85(width), r3=26(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 40
LDI r2, 85
LDI r3, 26
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
