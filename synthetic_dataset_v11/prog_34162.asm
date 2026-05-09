; DESCRIPTION: Renders a yellow box of size 76x97 starting at (158, 61).
; PLAN: r0=158(x), r1=61(y), r2=76(width), r3=97(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 61
LDI r2, 76
LDI r3, 97
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
