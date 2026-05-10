; DESCRIPTION: Places a orange 70x84 rectangle at position (363, 149).
; PLAN: r0=363(x), r1=149(y), r2=70(width), r3=84(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 149
LDI r2, 70
LDI r3, 84
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
