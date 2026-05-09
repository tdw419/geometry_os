; DESCRIPTION: Creates a white rectangular region at (47, 47) spanning 49 by 75 pixels.
; PLAN: r0=47(x), r1=47(y), r2=49(width), r3=75(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 47
LDI r2, 49
LDI r3, 75
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
