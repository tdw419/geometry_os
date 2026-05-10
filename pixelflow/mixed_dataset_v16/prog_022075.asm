; DESCRIPTION: Places a orange 89x107 rectangle at position (319, 8).
; PLAN: r0=319(x), r1=8(y), r2=89(width), r3=107(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 8
LDI r2, 89
LDI r3, 107
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
