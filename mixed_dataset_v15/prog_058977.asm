; DESCRIPTION: Renders a blue box of size 80x107 starting at (425, 20).
; PLAN: r0=425(x), r1=20(y), r2=80(width), r3=107(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 20
LDI r2, 80
LDI r3, 107
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
