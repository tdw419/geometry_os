; DESCRIPTION: Places a purple 39x108 rectangle at position (395, 73).
; PLAN: r0=395(x), r1=73(y), r2=39(width), r3=108(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 73
LDI r2, 39
LDI r3, 108
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
