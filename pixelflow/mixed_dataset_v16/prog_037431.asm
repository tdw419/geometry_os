; DESCRIPTION: Creates a yellow filled rectangle of size 75x37 starting at (17, 168).
; PLAN: r0=17(x), r1=168(y), r2=75(width), r3=37(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 168
LDI r2, 75
LDI r3, 37
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
