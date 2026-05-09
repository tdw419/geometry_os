; DESCRIPTION: Creates a white rectangular region at (108, 121) spanning 110 by 70 pixels.
; PLAN: r0=108(x), r1=121(y), r2=110(width), r3=70(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 121
LDI r2, 110
LDI r3, 70
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
