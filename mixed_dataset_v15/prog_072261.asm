; DESCRIPTION: Places a orange 33x69 rectangle at position (132, 157).
; PLAN: r0=132(x), r1=157(y), r2=33(width), r3=69(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 157
LDI r2, 33
LDI r3, 69
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
