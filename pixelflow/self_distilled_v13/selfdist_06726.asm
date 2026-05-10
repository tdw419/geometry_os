; DESCRIPTION: Creates a yellow filled rectangle of size 35x69 starting at (310, 192).
; PLAN: r0=310(x), r1=192(y), r2=35(width), r3=69(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 192
LDI r2, 35
LDI r3, 69
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
