; DESCRIPTION: Creates a yellow filled rectangle of size 98x70 starting at (74, 22).
; PLAN: r0=74(x), r1=22(y), r2=98(width), r3=70(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 22
LDI r2, 98
LDI r3, 70
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
