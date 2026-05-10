; DESCRIPTION: Creates a green filled rectangle of size 50x26 starting at (129, 97).
; PLAN: r0=129(x), r1=97(y), r2=50(width), r3=26(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 97
LDI r2, 50
LDI r3, 26
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
