; DESCRIPTION: Places a purple 43x34 rectangle at position (339, 217).
; PLAN: r0=339(x), r1=217(y), r2=43(width), r3=34(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 217
LDI r2, 43
LDI r3, 34
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
