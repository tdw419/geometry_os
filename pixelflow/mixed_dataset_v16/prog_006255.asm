; DESCRIPTION: Creates a blue rectangular region at (291, 91) spanning 102 by 83 pixels.
; PLAN: r0=291(x), r1=91(y), r2=102(width), r3=83(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 91
LDI r2, 102
LDI r3, 83
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
