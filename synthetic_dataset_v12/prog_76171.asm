; DESCRIPTION: Places a orange 107x26 rectangle at position (34, 145).
; PLAN: r0=34(x), r1=145(y), r2=107(width), r3=26(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 145
LDI r2, 107
LDI r3, 26
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
