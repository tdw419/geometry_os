; DESCRIPTION: Creates a yellow filled rectangle of size 99x95 starting at (375, 63).
; PLAN: r0=375(x), r1=63(y), r2=99(width), r3=95(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 63
LDI r2, 99
LDI r3, 95
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
