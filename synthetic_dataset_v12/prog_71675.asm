; DESCRIPTION: Creates a red rectangular region at (191, 217) spanning 62 by 35 pixels.
; PLAN: r0=191(x), r1=217(y), r2=62(width), r3=35(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 217
LDI r2, 62
LDI r3, 35
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
