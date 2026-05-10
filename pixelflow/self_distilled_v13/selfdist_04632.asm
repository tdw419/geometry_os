; DESCRIPTION: Creates a green filled rectangle of size 109x84 starting at (316, 69).
; PLAN: r0=316(x), r1=69(y), r2=109(width), r3=84(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 69
LDI r2, 109
LDI r3, 84
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
