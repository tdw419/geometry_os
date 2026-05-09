; DESCRIPTION: Places a orange 19x79 rectangle at position (188, 121).
; PLAN: r0=188(x), r1=121(y), r2=19(width), r3=79(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 121
LDI r2, 19
LDI r3, 79
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
