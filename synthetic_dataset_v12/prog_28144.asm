; DESCRIPTION: Renders a white box of size 88x72 starting at (324, 66).
; PLAN: r0=324(x), r1=66(y), r2=88(width), r3=72(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 66
LDI r2, 88
LDI r3, 72
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
