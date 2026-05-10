; DESCRIPTION: Creates a white rectangular region at (214, 55) spanning 105 by 119 pixels.
; PLAN: r0=214(x), r1=55(y), r2=105(width), r3=119(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 55
LDI r2, 105
LDI r3, 119
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
