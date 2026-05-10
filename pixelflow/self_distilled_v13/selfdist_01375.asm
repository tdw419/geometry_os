; DESCRIPTION: Creates a yellow filled rectangle of size 35x74 starting at (89, 117).
; PLAN: r0=89(x), r1=117(y), r2=35(width), r3=74(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 117
LDI r2, 35
LDI r3, 74
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
