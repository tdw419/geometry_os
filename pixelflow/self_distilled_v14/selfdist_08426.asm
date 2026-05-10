; DESCRIPTION: Creates a purple filled rectangle of size 62x67 starting at (182, 121).
; PLAN: r0=182(x), r1=121(y), r2=62(width), r3=67(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 121
LDI r2, 62
LDI r3, 67
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
