; DESCRIPTION: Creates a blue filled rectangle of size 99x75 starting at (71, 98).
; PLAN: r0=71(x), r1=98(y), r2=99(width), r3=75(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 98
LDI r2, 99
LDI r3, 75
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
