; DESCRIPTION: Creates a green filled rectangle of size 30x22 starting at (60, 77).
; PLAN: r0=60(x), r1=77(y), r2=30(width), r3=22(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 77
LDI r2, 30
LDI r3, 22
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
