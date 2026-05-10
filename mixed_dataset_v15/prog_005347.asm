; DESCRIPTION: Creates a green filled rectangle of size 17x87 starting at (264, 134).
; PLAN: r0=264(x), r1=134(y), r2=17(width), r3=87(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 134
LDI r2, 17
LDI r3, 87
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
