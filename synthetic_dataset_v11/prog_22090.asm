; DESCRIPTION: Places a orange 81x65 rectangle at position (166, 3).
; PLAN: r0=166(x), r1=3(y), r2=81(width), r3=65(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 3
LDI r2, 81
LDI r3, 65
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
