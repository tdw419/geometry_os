; DESCRIPTION: Renders a white box of size 85x96 starting at (136, 126).
; PLAN: r0=136(x), r1=126(y), r2=85(width), r3=96(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 126
LDI r2, 85
LDI r3, 96
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
