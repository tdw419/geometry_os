; DESCRIPTION: Creates a green filled rectangle of size 115x19 starting at (350, 35).
; PLAN: r0=350(x), r1=35(y), r2=115(width), r3=19(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 35
LDI r2, 115
LDI r3, 19
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
