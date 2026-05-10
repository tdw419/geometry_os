; DESCRIPTION: Places a blue 26x14 rectangle at position (55, 69).
; PLAN: r0=55(x), r1=69(y), r2=26(width), r3=14(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 69
LDI r2, 26
LDI r3, 14
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
