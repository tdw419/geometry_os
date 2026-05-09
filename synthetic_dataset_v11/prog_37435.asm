; DESCRIPTION: Places a red 11x119 rectangle at position (137, 115).
; PLAN: r0=137(x), r1=115(y), r2=11(width), r3=119(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 115
LDI r2, 11
LDI r3, 119
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
