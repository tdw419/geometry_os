; DESCRIPTION: Creates a white rectangular region at (65, 18) spanning 69 by 78 pixels.
; PLAN: r0=65(x), r1=18(y), r2=69(width), r3=78(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 18
LDI r2, 69
LDI r3, 78
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
