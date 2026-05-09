; DESCRIPTION: Renders a black box of size 86x47 starting at (236, 201).
; PLAN: r0=236(x), r1=201(y), r2=86(width), r3=47(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 201
LDI r2, 86
LDI r3, 47
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
