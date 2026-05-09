; DESCRIPTION: Places a orange 81x11 rectangle at position (226, 79).
; PLAN: r0=226(x), r1=79(y), r2=81(width), r3=11(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 79
LDI r2, 81
LDI r3, 11
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
