; DESCRIPTION: Renders a green box of size 112x24 starting at (88, 91).
; PLAN: r0=88(x), r1=91(y), r2=112(width), r3=24(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 91
LDI r2, 112
LDI r3, 24
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
