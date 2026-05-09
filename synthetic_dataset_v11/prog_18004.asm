; DESCRIPTION: Places a orange 13x33 rectangle at position (159, 185).
; PLAN: r0=159(x), r1=185(y), r2=13(width), r3=33(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 185
LDI r2, 13
LDI r3, 33
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
