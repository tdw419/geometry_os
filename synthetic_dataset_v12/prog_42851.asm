; DESCRIPTION: Places a orange 85x99 rectangle at position (390, 61).
; PLAN: r0=390(x), r1=61(y), r2=85(width), r3=99(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 61
LDI r2, 85
LDI r3, 99
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
