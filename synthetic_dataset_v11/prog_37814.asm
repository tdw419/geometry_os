; DESCRIPTION: Places a orange 84x23 rectangle at position (52, 94).
; PLAN: r0=52(x), r1=94(y), r2=84(width), r3=23(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 94
LDI r2, 84
LDI r3, 23
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
