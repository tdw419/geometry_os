; DESCRIPTION: Creates a yellow filled rectangle of size 38x80 starting at (117, 19).
; PLAN: r0=117(x), r1=19(y), r2=38(width), r3=80(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 19
LDI r2, 38
LDI r3, 80
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
