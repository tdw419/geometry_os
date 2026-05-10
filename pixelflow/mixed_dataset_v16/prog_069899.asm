; DESCRIPTION: Creates a green filled rectangle of size 59x31 starting at (31, 86).
; PLAN: r0=31(x), r1=86(y), r2=59(width), r3=31(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 86
LDI r2, 59
LDI r3, 31
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
