; DESCRIPTION: Places a orange 119x25 rectangle at position (367, 147).
; PLAN: r0=367(x), r1=147(y), r2=119(width), r3=25(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 147
LDI r2, 119
LDI r3, 25
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
