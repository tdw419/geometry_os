; DESCRIPTION: Places a orange 114x85 rectangle at position (3, 69).
; PLAN: r0=3(x), r1=69(y), r2=114(width), r3=85(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 69
LDI r2, 114
LDI r3, 85
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
