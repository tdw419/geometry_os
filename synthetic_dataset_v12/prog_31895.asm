; DESCRIPTION: Creates a white rectangular region at (49, 79) spanning 46 by 34 pixels.
; PLAN: r0=49(x), r1=79(y), r2=46(width), r3=34(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 79
LDI r2, 46
LDI r3, 34
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
