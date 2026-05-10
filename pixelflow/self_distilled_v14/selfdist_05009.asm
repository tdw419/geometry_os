; DESCRIPTION: Creates a blue filled rectangle of size 75x17 starting at (122, 30).
; PLAN: r0=122(x), r1=30(y), r2=75(width), r3=17(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 30
LDI r2, 75
LDI r3, 17
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
