; DESCRIPTION: Places a orange 89x102 box at position (38, 35).
; PLAN: r0=38(x), r1=35(y), r2=89(width), r3=102(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 35
LDI r2, 89
LDI r3, 102
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
