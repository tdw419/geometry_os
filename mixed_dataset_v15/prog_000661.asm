; DESCRIPTION: Places a orange 57x37 rectangle at position (244, 78).
; PLAN: r0=244(x), r1=78(y), r2=57(width), r3=37(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 78
LDI r2, 57
LDI r3, 37
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
