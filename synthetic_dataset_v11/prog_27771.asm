; DESCRIPTION: Creates a white rectangular region at (145, 182) spanning 40 by 43 pixels.
; PLAN: r0=145(x), r1=182(y), r2=40(width), r3=43(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 182
LDI r2, 40
LDI r3, 43
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
