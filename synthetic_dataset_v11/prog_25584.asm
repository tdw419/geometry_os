; DESCRIPTION: Creates a white rectangular region at (85, 113) spanning 113 by 44 pixels.
; PLAN: r0=85(x), r1=113(y), r2=113(width), r3=44(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 113
LDI r2, 113
LDI r3, 44
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
