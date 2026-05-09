; DESCRIPTION: Creates a white rectangular region at (119, 127) spanning 110 by 55 pixels.
; PLAN: r0=119(x), r1=127(y), r2=110(width), r3=55(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 127
LDI r2, 110
LDI r3, 55
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
