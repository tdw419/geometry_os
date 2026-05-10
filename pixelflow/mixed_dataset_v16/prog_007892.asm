; DESCRIPTION: Creates a green filled rectangle of size 97x25 starting at (80, 123).
; PLAN: r0=80(x), r1=123(y), r2=97(width), r3=25(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 123
LDI r2, 97
LDI r3, 25
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
