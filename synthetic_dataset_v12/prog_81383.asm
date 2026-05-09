; DESCRIPTION: Renders a blue box of size 98x38 starting at (158, 199).
; PLAN: r0=158(x), r1=199(y), r2=98(width), r3=38(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 199
LDI r2, 98
LDI r3, 38
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
