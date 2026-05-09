; DESCRIPTION: Renders a black box of size 97x30 starting at (244, 201).
; PLAN: r0=244(x), r1=201(y), r2=97(width), r3=30(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 201
LDI r2, 97
LDI r3, 30
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
