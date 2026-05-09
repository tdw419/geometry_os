; DESCRIPTION: Places a orange 116x13 rectangle at position (51, 85).
; PLAN: r0=51(x), r1=85(y), r2=116(width), r3=13(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 85
LDI r2, 116
LDI r3, 13
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
