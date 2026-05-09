; DESCRIPTION: Places a orange 58x69 rectangle at position (142, 7).
; PLAN: r0=142(x), r1=7(y), r2=58(width), r3=69(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 7
LDI r2, 58
LDI r3, 69
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
