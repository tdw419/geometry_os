; DESCRIPTION: Renders a white box of size 20x91 starting at (136, 104).
; PLAN: r0=136(x), r1=104(y), r2=20(width), r3=91(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 104
LDI r2, 20
LDI r3, 91
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
