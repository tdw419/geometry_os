; DESCRIPTION: Places a orange 90x13 box at position (283, 148).
; PLAN: r0=283(x), r1=148(y), r2=90(width), r3=13(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 148
LDI r2, 90
LDI r3, 13
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
