; DESCRIPTION: Renders a white box of size 97x98 starting at (157, 7).
; PLAN: r0=157(x), r1=7(y), r2=97(width), r3=98(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 7
LDI r2, 97
LDI r3, 98
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
