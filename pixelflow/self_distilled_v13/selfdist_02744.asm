; DESCRIPTION: Creates a blue filled rectangle of size 57x67 starting at (68, 123).
; PLAN: r0=68(x), r1=123(y), r2=57(width), r3=67(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 123
LDI r2, 57
LDI r3, 67
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
