; DESCRIPTION: Creates a white rectangular region at (20, 141) spanning 91 by 55 pixels.
; PLAN: r0=20(x), r1=141(y), r2=91(width), r3=55(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 141
LDI r2, 91
LDI r3, 55
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
