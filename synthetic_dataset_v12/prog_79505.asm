; DESCRIPTION: Creates a white rectangular region at (485, 105) spanning 21 by 34 pixels.
; PLAN: r0=485(x), r1=105(y), r2=21(width), r3=34(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 105
LDI r2, 21
LDI r3, 34
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
