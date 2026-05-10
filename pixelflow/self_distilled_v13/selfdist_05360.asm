; DESCRIPTION: Creates a yellow filled rectangle of size 107x50 starting at (334, 99).
; PLAN: r0=334(x), r1=99(y), r2=107(width), r3=50(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 99
LDI r2, 107
LDI r3, 50
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
