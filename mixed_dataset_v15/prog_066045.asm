; DESCRIPTION: Renders a blue box of size 10x85 starting at (344, 18).
; PLAN: r0=344(x), r1=18(y), r2=10(width), r3=85(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 18
LDI r2, 10
LDI r3, 85
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
