; DESCRIPTION: Creates a green rectangular region at (19, 172) spanning 43 by 82 pixels.
; PLAN: r0=19(x), r1=172(y), r2=43(width), r3=82(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 172
LDI r2, 43
LDI r3, 82
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
