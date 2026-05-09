; DESCRIPTION: Places a orange 119x33 rectangle at position (66, 160).
; PLAN: r0=66(x), r1=160(y), r2=119(width), r3=33(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 160
LDI r2, 119
LDI r3, 33
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
