; DESCRIPTION: Creates a blue filled rectangle of size 46x48 starting at (17, 97).
; PLAN: r0=17(x), r1=97(y), r2=46(width), r3=48(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 97
LDI r2, 46
LDI r3, 48
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
