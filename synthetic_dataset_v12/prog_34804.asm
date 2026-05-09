; DESCRIPTION: Creates a red rectangular region at (318, 185) spanning 57 by 34 pixels.
; PLAN: r0=318(x), r1=185(y), r2=57(width), r3=34(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 185
LDI r2, 57
LDI r3, 34
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
