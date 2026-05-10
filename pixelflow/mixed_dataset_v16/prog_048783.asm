; DESCRIPTION: Creates a green filled rectangle of size 114x16 starting at (116, 75).
; PLAN: r0=116(x), r1=75(y), r2=114(width), r3=16(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 75
LDI r2, 114
LDI r3, 16
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
