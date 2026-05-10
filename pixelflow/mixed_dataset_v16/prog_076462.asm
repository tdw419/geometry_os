; DESCRIPTION: Creates a green filled rectangle of size 45x10 starting at (253, 20).
; PLAN: r0=253(x), r1=20(y), r2=45(width), r3=10(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 20
LDI r2, 45
LDI r3, 10
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
