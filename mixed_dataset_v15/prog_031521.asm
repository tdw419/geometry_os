; DESCRIPTION: Creates a blue filled rectangle of size 74x62 starting at (313, 87).
; PLAN: r0=313(x), r1=87(y), r2=74(width), r3=62(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 87
LDI r2, 74
LDI r3, 62
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
