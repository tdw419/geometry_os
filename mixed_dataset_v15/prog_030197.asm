; DESCRIPTION: Places a orange 57x52 rectangle at position (155, 87).
; PLAN: r0=155(x), r1=87(y), r2=57(width), r3=52(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 87
LDI r2, 57
LDI r3, 52
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
