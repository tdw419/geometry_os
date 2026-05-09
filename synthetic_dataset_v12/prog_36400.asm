; DESCRIPTION: Places a orange 19x116 rectangle at position (181, 66).
; PLAN: r0=181(x), r1=66(y), r2=19(width), r3=116(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 66
LDI r2, 19
LDI r3, 116
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
