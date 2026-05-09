; DESCRIPTION: Places a orange 12x68 rectangle at position (325, 119).
; PLAN: r0=325(x), r1=119(y), r2=12(width), r3=68(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 119
LDI r2, 12
LDI r3, 68
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
