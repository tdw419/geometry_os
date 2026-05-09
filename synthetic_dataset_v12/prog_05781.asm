; DESCRIPTION: Creates a white rectangular region at (430, 55) spanning 13 by 38 pixels.
; PLAN: r0=430(x), r1=55(y), r2=13(width), r3=38(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 55
LDI r2, 13
LDI r3, 38
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
