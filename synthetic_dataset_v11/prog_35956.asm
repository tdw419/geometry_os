; DESCRIPTION: Renders a white box of size 106x76 starting at (31, 97).
; PLAN: r0=31(x), r1=97(y), r2=106(width), r3=76(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 97
LDI r2, 106
LDI r3, 76
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
