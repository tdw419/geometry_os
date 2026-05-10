; DESCRIPTION: Renders a white box of size 20x85 starting at (208, 74).
; PLAN: r0=208(x), r1=74(y), r2=20(width), r3=85(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 74
LDI r2, 20
LDI r3, 85
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
