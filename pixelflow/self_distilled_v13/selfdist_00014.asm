; DESCRIPTION: Creates a purple filled rectangle of size 108x74 starting at (198, 155).
; PLAN: r0=198(x), r1=155(y), r2=108(width), r3=74(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 155
LDI r2, 108
LDI r3, 74
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
