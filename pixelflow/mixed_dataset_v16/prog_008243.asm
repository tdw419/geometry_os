; DESCRIPTION: Renders a blue box of size 93x26 starting at (15, 188).
; PLAN: r0=15(x), r1=188(y), r2=93(width), r3=26(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 188
LDI r2, 93
LDI r3, 26
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
