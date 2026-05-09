; DESCRIPTION: Renders a blue box of size 112x52 starting at (109, 91).
; PLAN: r0=109(x), r1=91(y), r2=112(width), r3=52(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 91
LDI r2, 112
LDI r3, 52
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
