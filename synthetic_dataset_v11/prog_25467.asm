; DESCRIPTION: Creates a yellow rectangular region at (71, 145) spanning 17 by 57 pixels.
; PLAN: r0=71(x), r1=145(y), r2=17(width), r3=57(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 145
LDI r2, 17
LDI r3, 57
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
