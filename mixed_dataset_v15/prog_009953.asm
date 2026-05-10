; DESCRIPTION: Places a black 115x52 rectangle at position (119, 203).
; PLAN: r0=119(x), r1=203(y), r2=115(width), r3=52(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 203
LDI r2, 115
LDI r3, 52
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
