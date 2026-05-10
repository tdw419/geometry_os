; DESCRIPTION: Creates a green filled rectangle of size 62x61 starting at (50, 23).
; PLAN: r0=50(x), r1=23(y), r2=62(width), r3=61(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 23
LDI r2, 62
LDI r3, 61
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
