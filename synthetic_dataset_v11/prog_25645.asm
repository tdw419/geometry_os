; DESCRIPTION: Places a red 81x14 rectangle at position (66, 106).
; PLAN: r0=66(x), r1=106(y), r2=81(width), r3=14(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 106
LDI r2, 81
LDI r3, 14
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
