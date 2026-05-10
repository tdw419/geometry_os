; DESCRIPTION: Creates a yellow filled rectangle of size 17x84 starting at (295, 11).
; PLAN: r0=295(x), r1=11(y), r2=17(width), r3=84(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 11
LDI r2, 17
LDI r3, 84
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
