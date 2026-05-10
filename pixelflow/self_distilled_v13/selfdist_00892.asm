; DESCRIPTION: Creates a green filled rectangle of size 83x75 starting at (88, 48).
; PLAN: r0=88(x), r1=48(y), r2=83(width), r3=75(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 48
LDI r2, 83
LDI r3, 75
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
