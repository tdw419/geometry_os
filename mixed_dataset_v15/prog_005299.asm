; DESCRIPTION: Renders a green box of size 97x39 starting at (339, 47).
; PLAN: r0=339(x), r1=47(y), r2=97(width), r3=39(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 47
LDI r2, 97
LDI r3, 39
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
