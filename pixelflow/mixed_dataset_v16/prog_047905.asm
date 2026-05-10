; DESCRIPTION: Places a purple 69x26 rectangle at position (187, 74).
; PLAN: r0=187(x), r1=74(y), r2=69(width), r3=26(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 74
LDI r2, 69
LDI r3, 26
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
