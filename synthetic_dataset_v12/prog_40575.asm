; DESCRIPTION: Places a red 78x109 rectangle at position (115, 118).
; PLAN: r0=115(x), r1=118(y), r2=78(width), r3=109(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 118
LDI r2, 78
LDI r3, 109
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
