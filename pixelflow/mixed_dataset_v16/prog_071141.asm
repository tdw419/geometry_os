; DESCRIPTION: Creates a white rectangular region at (33, 29) spanning 85 by 24 pixels.
; PLAN: r0=33(x), r1=29(y), r2=85(width), r3=24(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 29
LDI r2, 85
LDI r3, 24
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
