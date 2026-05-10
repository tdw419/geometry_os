; DESCRIPTION: Creates a white rectangular region at (199, 86) spanning 19 by 39 pixels.
; PLAN: r0=199(x), r1=86(y), r2=19(width), r3=39(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 86
LDI r2, 19
LDI r3, 39
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
