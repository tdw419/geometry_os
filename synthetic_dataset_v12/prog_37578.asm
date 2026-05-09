; DESCRIPTION: Creates a yellow rectangular region at (216, 210) spanning 58 by 19 pixels.
; PLAN: r0=216(x), r1=210(y), r2=58(width), r3=19(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 210
LDI r2, 58
LDI r3, 19
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
