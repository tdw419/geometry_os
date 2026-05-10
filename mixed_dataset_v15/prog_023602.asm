; DESCRIPTION: Places a orange 79x70 rectangle at position (97, 46).
; PLAN: r0=97(x), r1=46(y), r2=79(width), r3=70(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 46
LDI r2, 79
LDI r3, 70
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
