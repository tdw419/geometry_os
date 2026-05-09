; DESCRIPTION: Creates a white rectangular region at (48, 113) spanning 114 by 38 pixels.
; PLAN: r0=48(x), r1=113(y), r2=114(width), r3=38(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 113
LDI r2, 114
LDI r3, 38
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
