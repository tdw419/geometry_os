; DESCRIPTION: Places a orange 88x119 rectangle at position (108, 82).
; PLAN: r0=108(x), r1=82(y), r2=88(width), r3=119(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 82
LDI r2, 88
LDI r3, 119
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
