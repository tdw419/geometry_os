; DESCRIPTION: Creates a yellow rectangular region at (138, 145) spanning 43 by 80 pixels.
; PLAN: r0=138(x), r1=145(y), r2=43(width), r3=80(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 145
LDI r2, 43
LDI r3, 80
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
