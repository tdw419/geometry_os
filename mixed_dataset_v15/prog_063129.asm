; DESCRIPTION: Renders a green box of size 50x114 starting at (250, 68).
; PLAN: r0=250(x), r1=68(y), r2=50(width), r3=114(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 68
LDI r2, 50
LDI r3, 114
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
