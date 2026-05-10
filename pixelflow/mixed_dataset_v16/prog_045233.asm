; DESCRIPTION: Renders a green box of size 84x15 starting at (12, 118).
; PLAN: r0=12(x), r1=118(y), r2=84(width), r3=15(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 118
LDI r2, 84
LDI r3, 15
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
