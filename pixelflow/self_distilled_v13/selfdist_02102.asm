; DESCRIPTION: Creates a yellow filled rectangle of size 110x45 starting at (300, 141).
; PLAN: r0=300(x), r1=141(y), r2=110(width), r3=45(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 141
LDI r2, 110
LDI r3, 45
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
