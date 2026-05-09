; DESCRIPTION: Places a orange 77x19 rectangle at position (15, 207).
; PLAN: r0=15(x), r1=207(y), r2=77(width), r3=19(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 207
LDI r2, 77
LDI r3, 19
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
