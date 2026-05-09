; DESCRIPTION: Places a white 115x118 rectangle at position (359, 9).
; PLAN: r0=359(x), r1=9(y), r2=115(width), r3=118(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 9
LDI r2, 115
LDI r3, 118
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
