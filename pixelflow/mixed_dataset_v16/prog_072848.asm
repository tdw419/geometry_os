; DESCRIPTION: Places a purple 69x14 rectangle at position (6, 92).
; PLAN: r0=6(x), r1=92(y), r2=69(width), r3=14(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 92
LDI r2, 69
LDI r3, 14
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
