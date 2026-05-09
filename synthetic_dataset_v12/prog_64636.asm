; DESCRIPTION: Places a orange 14x94 rectangle at position (43, 66).
; PLAN: r0=43(x), r1=66(y), r2=14(width), r3=94(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 66
LDI r2, 14
LDI r3, 94
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
