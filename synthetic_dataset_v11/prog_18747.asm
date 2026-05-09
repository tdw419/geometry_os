; DESCRIPTION: Renders a blue box of size 102x107 starting at (20, 91).
; PLAN: r0=20(x), r1=91(y), r2=102(width), r3=107(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 91
LDI r2, 102
LDI r3, 107
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
