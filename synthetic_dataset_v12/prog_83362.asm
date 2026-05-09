; DESCRIPTION: Places a orange 35x79 rectangle at position (13, 141).
; PLAN: r0=13(x), r1=141(y), r2=35(width), r3=79(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 141
LDI r2, 35
LDI r3, 79
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
