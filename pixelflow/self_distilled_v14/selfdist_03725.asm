; DESCRIPTION: Creates a purple filled rectangle of size 39x53 starting at (213, 102).
; PLAN: r0=213(x), r1=102(y), r2=39(width), r3=53(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 102
LDI r2, 39
LDI r3, 53
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
