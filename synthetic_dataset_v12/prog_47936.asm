; DESCRIPTION: Places a black 20x119 rectangle at position (427, 124).
; PLAN: r0=427(x), r1=124(y), r2=20(width), r3=119(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 124
LDI r2, 20
LDI r3, 119
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
