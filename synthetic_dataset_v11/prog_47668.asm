; DESCRIPTION: Places a orange 56x58 rectangle at position (119, 120).
; PLAN: r0=119(x), r1=120(y), r2=56(width), r3=58(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 120
LDI r2, 56
LDI r3, 58
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
