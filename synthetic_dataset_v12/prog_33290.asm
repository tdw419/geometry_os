; DESCRIPTION: Creates a white rectangular region at (28, 167) spanning 46 by 66 pixels.
; PLAN: r0=28(x), r1=167(y), r2=46(width), r3=66(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 167
LDI r2, 46
LDI r3, 66
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
