; DESCRIPTION: Places a black 118x62 rectangle at position (290, 141).
; PLAN: r0=290(x), r1=141(y), r2=118(width), r3=62(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 141
LDI r2, 118
LDI r3, 62
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
