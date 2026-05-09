; DESCRIPTION: Places a orange 19x85 rectangle at position (225, 119).
; PLAN: r0=225(x), r1=119(y), r2=19(width), r3=85(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 119
LDI r2, 19
LDI r3, 85
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
