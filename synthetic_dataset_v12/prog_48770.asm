; DESCRIPTION: Renders a green box of size 97x31 starting at (60, 199).
; PLAN: r0=60(x), r1=199(y), r2=97(width), r3=31(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 199
LDI r2, 97
LDI r3, 31
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
