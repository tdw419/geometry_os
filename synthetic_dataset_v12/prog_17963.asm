; DESCRIPTION: Places a orange 85x35 rectangle at position (16, 119).
; PLAN: r0=16(x), r1=119(y), r2=85(width), r3=35(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 119
LDI r2, 85
LDI r3, 35
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
