; DESCRIPTION: Places a orange 19x70 rectangle at position (150, 87).
; PLAN: r0=150(x), r1=87(y), r2=19(width), r3=70(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 87
LDI r2, 19
LDI r3, 70
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
