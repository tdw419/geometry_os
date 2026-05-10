; DESCRIPTION: Creates a green filled rectangle of size 19x23 starting at (328, 65).
; PLAN: r0=328(x), r1=65(y), r2=19(width), r3=23(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 65
LDI r2, 19
LDI r3, 23
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
