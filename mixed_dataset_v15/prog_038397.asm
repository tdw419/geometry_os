; DESCRIPTION: Creates a green filled rectangle of size 116x30 starting at (80, 188).
; PLAN: r0=80(x), r1=188(y), r2=116(width), r3=30(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 188
LDI r2, 116
LDI r3, 30
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
