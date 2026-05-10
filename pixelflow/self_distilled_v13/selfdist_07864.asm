; DESCRIPTION: Creates a blue filled rectangle of size 35x116 starting at (331, 43).
; PLAN: r0=331(x), r1=43(y), r2=35(width), r3=116(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 43
LDI r2, 35
LDI r3, 116
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
