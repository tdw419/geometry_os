; DESCRIPTION: Places a red 118x54 rectangle at position (58, 179).
; PLAN: r0=58(x), r1=179(y), r2=118(width), r3=54(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 179
LDI r2, 118
LDI r3, 54
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
