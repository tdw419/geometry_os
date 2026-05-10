; DESCRIPTION: Places a orange 45x46 box at position (122, 13).
; PLAN: r0=122(x), r1=13(y), r2=45(width), r3=46(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 13
LDI r2, 45
LDI r3, 46
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
