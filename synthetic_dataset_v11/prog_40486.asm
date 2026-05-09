; DESCRIPTION: Creates a white rectangular region at (152, 105) spanning 66 by 108 pixels.
; PLAN: r0=152(x), r1=105(y), r2=66(width), r3=108(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 105
LDI r2, 66
LDI r3, 108
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
