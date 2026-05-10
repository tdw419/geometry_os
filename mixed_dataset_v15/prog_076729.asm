; DESCRIPTION: Creates a white rectangular region at (15, 79) spanning 99 by 41 pixels.
; PLAN: r0=15(x), r1=79(y), r2=99(width), r3=41(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 79
LDI r2, 99
LDI r3, 41
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
