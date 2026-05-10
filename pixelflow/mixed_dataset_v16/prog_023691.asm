; DESCRIPTION: Places a orange 108x31 box at position (175, 118).
; PLAN: r0=175(x), r1=118(y), r2=108(width), r3=31(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 118
LDI r2, 108
LDI r3, 31
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
