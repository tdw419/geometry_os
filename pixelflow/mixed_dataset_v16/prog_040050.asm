; DESCRIPTION: Renders a white box of size 86x26 starting at (97, 65).
; PLAN: r0=97(x), r1=65(y), r2=86(width), r3=26(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 65
LDI r2, 86
LDI r3, 26
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
