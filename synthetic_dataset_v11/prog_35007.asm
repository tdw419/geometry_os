; DESCRIPTION: Renders a green box of size 97x75 starting at (157, 165).
; PLAN: r0=157(x), r1=165(y), r2=97(width), r3=75(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 165
LDI r2, 97
LDI r3, 75
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
