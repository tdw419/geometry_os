; DESCRIPTION: Places a white 15x114 rectangle at position (179, 35).
; PLAN: r0=179(x), r1=35(y), r2=15(width), r3=114(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 35
LDI r2, 15
LDI r3, 114
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
