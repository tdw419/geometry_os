; DESCRIPTION: Places a purple 26x71 rectangle at position (108, 58).
; PLAN: r0=108(x), r1=58(y), r2=26(width), r3=71(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 58
LDI r2, 26
LDI r3, 71
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
