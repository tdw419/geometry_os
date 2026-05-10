; DESCRIPTION: Renders a white box of size 88x66 starting at (35, 85).
; PLAN: r0=35(x), r1=85(y), r2=88(width), r3=66(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 85
LDI r2, 88
LDI r3, 66
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
