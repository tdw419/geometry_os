; DESCRIPTION: Places a purple 73x108 rectangle at position (339, 43).
; PLAN: r0=339(x), r1=43(y), r2=73(width), r3=108(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 43
LDI r2, 73
LDI r3, 108
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
