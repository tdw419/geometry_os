; DESCRIPTION: Places a black 118x106 rectangle at position (98, 36).
; PLAN: r0=98(x), r1=36(y), r2=118(width), r3=106(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 36
LDI r2, 118
LDI r3, 106
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
