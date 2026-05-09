; DESCRIPTION: Renders a black box of size 107x26 starting at (104, 201).
; PLAN: r0=104(x), r1=201(y), r2=107(width), r3=26(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 201
LDI r2, 107
LDI r3, 26
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
