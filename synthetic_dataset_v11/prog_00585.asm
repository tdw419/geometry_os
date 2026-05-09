; DESCRIPTION: Renders a blue box of size 66x70 starting at (85, 26).
; PLAN: r0=85(x), r1=26(y), r2=66(width), r3=70(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 26
LDI r2, 66
LDI r3, 70
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
