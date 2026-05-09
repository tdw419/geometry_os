; DESCRIPTION: Places a orange 11x24 rectangle at position (37, 207).
; PLAN: r0=37(x), r1=207(y), r2=11(width), r3=24(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 207
LDI r2, 11
LDI r3, 24
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
