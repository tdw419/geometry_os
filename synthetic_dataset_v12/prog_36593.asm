; DESCRIPTION: Places a red 26x119 rectangle at position (453, 94).
; PLAN: r0=453(x), r1=94(y), r2=26(width), r3=119(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 94
LDI r2, 26
LDI r3, 119
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
