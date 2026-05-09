; DESCRIPTION: Places a red 115x94 rectangle at position (24, 122).
; PLAN: r0=24(x), r1=122(y), r2=115(width), r3=94(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 122
LDI r2, 115
LDI r3, 94
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
