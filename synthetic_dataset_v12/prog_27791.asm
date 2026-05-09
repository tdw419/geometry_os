; DESCRIPTION: Places a orange 31x88 rectangle at position (35, 37).
; PLAN: r0=35(x), r1=37(y), r2=31(width), r3=88(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 37
LDI r2, 31
LDI r3, 88
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
