; DESCRIPTION: Creates a white rectangular region at (112, 156) spanning 46 by 69 pixels.
; PLAN: r0=112(x), r1=156(y), r2=46(width), r3=69(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 156
LDI r2, 46
LDI r3, 69
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
