; DESCRIPTION: Creates a white rectangular region at (39, 196) spanning 78 by 55 pixels.
; PLAN: r0=39(x), r1=196(y), r2=78(width), r3=55(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 196
LDI r2, 78
LDI r3, 55
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
