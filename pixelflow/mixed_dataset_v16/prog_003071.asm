; DESCRIPTION: Renders a green box of size 106x96 starting at (157, 56).
; PLAN: r0=157(x), r1=56(y), r2=106(width), r3=96(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 56
LDI r2, 106
LDI r3, 96
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
