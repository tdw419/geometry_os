; DESCRIPTION: Places a red 45x19 rectangle at position (119, 97).
; PLAN: r0=119(x), r1=97(y), r2=45(width), r3=19(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 97
LDI r2, 45
LDI r3, 19
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
