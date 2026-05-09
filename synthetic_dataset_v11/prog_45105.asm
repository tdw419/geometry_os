; DESCRIPTION: Renders a blue box of size 75x105 starting at (60, 15).
; PLAN: r0=60(x), r1=15(y), r2=75(width), r3=105(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 15
LDI r2, 75
LDI r3, 105
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
