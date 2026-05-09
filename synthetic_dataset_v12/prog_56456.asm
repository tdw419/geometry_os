; DESCRIPTION: Creates a red rectangular region at (283, 71) spanning 66 by 83 pixels.
; PLAN: r0=283(x), r1=71(y), r2=66(width), r3=83(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 71
LDI r2, 66
LDI r3, 83
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
