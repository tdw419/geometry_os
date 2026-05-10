; DESCRIPTION: Creates a white rectangular region at (199, 80) spanning 35 by 24 pixels.
; PLAN: r0=199(x), r1=80(y), r2=35(width), r3=24(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 80
LDI r2, 35
LDI r3, 24
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
