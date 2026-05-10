; DESCRIPTION: Creates a cyan filled rectangle of size 84x88 starting at (54, 165).
; PLAN: r0=54(x), r1=165(y), r2=84(width), r3=88(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 165
LDI r2, 84
LDI r3, 88
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
