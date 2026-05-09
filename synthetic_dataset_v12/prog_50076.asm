; DESCRIPTION: Renders a blue box of size 77x24 starting at (99, 187).
; PLAN: r0=99(x), r1=187(y), r2=77(width), r3=24(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 187
LDI r2, 77
LDI r3, 24
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
