; DESCRIPTION: Renders a white box of size 98x66 starting at (8, 88).
; PLAN: r0=8(x), r1=88(y), r2=98(width), r3=66(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 88
LDI r2, 98
LDI r3, 66
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
