; DESCRIPTION: Renders a blue box of size 78x37 starting at (75, 16).
; PLAN: r0=75(x), r1=16(y), r2=78(width), r3=37(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 16
LDI r2, 78
LDI r3, 37
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
