; DESCRIPTION: Renders a white box of size 112x102 starting at (30, 97).
; PLAN: r0=30(x), r1=97(y), r2=112(width), r3=102(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 97
LDI r2, 112
LDI r3, 102
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
