; DESCRIPTION: Renders a white box of size 88x97 starting at (4, 95).
; PLAN: r0=4(x), r1=95(y), r2=88(width), r3=97(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 95
LDI r2, 88
LDI r3, 97
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
