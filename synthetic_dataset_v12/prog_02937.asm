; DESCRIPTION: Renders a green box of size 90x105 starting at (34, 68).
; PLAN: r0=34(x), r1=68(y), r2=90(width), r3=105(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 68
LDI r2, 90
LDI r3, 105
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
