; DESCRIPTION: Places a orange 110x98 rectangle at position (238, 26).
; PLAN: r0=238(x), r1=26(y), r2=110(width), r3=98(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 26
LDI r2, 110
LDI r3, 98
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
