; DESCRIPTION: Places a orange 11x18 box at position (99, 14).
; PLAN: r0=99(x), r1=14(y), r2=11(width), r3=18(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 14
LDI r2, 11
LDI r3, 18
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
