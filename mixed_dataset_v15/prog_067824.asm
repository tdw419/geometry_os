; DESCRIPTION: Creates a yellow filled rectangle of size 80x15 starting at (370, 14).
; PLAN: r0=370(x), r1=14(y), r2=80(width), r3=15(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 14
LDI r2, 80
LDI r3, 15
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
