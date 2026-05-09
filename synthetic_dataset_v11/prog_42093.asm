; DESCRIPTION: Places a orange 70x78 rectangle at position (51, 63).
; PLAN: r0=51(x), r1=63(y), r2=70(width), r3=78(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 63
LDI r2, 70
LDI r3, 78
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
