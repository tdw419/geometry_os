; DESCRIPTION: Creates a orange rectangular region at (194, 17) spanning 17 by 71 pixels.
; PLAN: r0=194(x), r1=17(y), r2=17(width), r3=71(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 17
LDI r2, 17
LDI r3, 71
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
