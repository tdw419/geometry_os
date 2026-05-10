; DESCRIPTION: Places a orange 56x81 box at position (9, 166).
; PLAN: r0=9(x), r1=166(y), r2=56(width), r3=81(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 166
LDI r2, 56
LDI r3, 81
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
