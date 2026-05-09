; DESCRIPTION: Creates a white rectangular region at (65, 105) spanning 109 by 55 pixels.
; PLAN: r0=65(x), r1=105(y), r2=109(width), r3=55(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 105
LDI r2, 109
LDI r3, 55
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
