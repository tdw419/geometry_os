; DESCRIPTION: Places a orange 86x88 rectangle at position (115, 119).
; PLAN: r0=115(x), r1=119(y), r2=86(width), r3=88(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 119
LDI r2, 86
LDI r3, 88
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
