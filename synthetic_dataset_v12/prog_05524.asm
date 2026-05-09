; DESCRIPTION: Places a purple 69x97 rectangle at position (333, 116).
; PLAN: r0=333(x), r1=116(y), r2=69(width), r3=97(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 116
LDI r2, 69
LDI r3, 97
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
