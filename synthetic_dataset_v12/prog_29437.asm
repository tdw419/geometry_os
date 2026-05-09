; DESCRIPTION: Creates a white rectangular region at (21, 121) spanning 85 by 106 pixels.
; PLAN: r0=21(x), r1=121(y), r2=85(width), r3=106(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 121
LDI r2, 85
LDI r3, 106
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
