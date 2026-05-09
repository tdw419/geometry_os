; DESCRIPTION: Places a orange 37x44 rectangle at position (13, 80).
; PLAN: r0=13(x), r1=80(y), r2=37(width), r3=44(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 80
LDI r2, 37
LDI r3, 44
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
