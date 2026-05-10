; DESCRIPTION: Creates a yellow filled rectangle of size 115x63 starting at (49, 94).
; PLAN: r0=49(x), r1=94(y), r2=115(width), r3=63(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 94
LDI r2, 115
LDI r3, 63
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
