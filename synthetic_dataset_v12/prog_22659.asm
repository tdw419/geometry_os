; DESCRIPTION: Places a orange 18x62 rectangle at position (431, 80).
; PLAN: r0=431(x), r1=80(y), r2=18(width), r3=62(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 80
LDI r2, 18
LDI r3, 62
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
