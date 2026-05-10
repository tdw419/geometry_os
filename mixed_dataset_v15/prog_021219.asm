; DESCRIPTION: Creates a orange filled rectangle of size 17x21 starting at (141, 148).
; PLAN: r0=141(x), r1=148(y), r2=17(width), r3=21(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 148
LDI r2, 17
LDI r3, 21
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
