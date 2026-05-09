; DESCRIPTION: Renders a green box of size 90x66 starting at (338, 118).
; PLAN: r0=338(x), r1=118(y), r2=90(width), r3=66(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 118
LDI r2, 90
LDI r3, 66
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
