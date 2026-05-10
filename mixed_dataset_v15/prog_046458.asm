; DESCRIPTION: Places a orange 66x96 rectangle at position (385, 63).
; PLAN: r0=385(x), r1=63(y), r2=66(width), r3=96(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 63
LDI r2, 66
LDI r3, 96
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
