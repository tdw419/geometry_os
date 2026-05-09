; DESCRIPTION: Places a orange 77x58 rectangle at position (79, 180).
; PLAN: r0=79(x), r1=180(y), r2=77(width), r3=58(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 180
LDI r2, 77
LDI r3, 58
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
