; DESCRIPTION: Places a orange 12x56 rectangle at position (302, 97).
; PLAN: r0=302(x), r1=97(y), r2=12(width), r3=56(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 97
LDI r2, 12
LDI r3, 56
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
