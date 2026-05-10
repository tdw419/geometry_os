; DESCRIPTION: Places a orange 17x76 box at position (152, 35).
; PLAN: r0=152(x), r1=35(y), r2=17(width), r3=76(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 35
LDI r2, 17
LDI r3, 76
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
