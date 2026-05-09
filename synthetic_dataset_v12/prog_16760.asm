; DESCRIPTION: Creates a white rectangular region at (208, 57) spanning 76 by 88 pixels.
; PLAN: r0=208(x), r1=57(y), r2=76(width), r3=88(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 57
LDI r2, 76
LDI r3, 88
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
