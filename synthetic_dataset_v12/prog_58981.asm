; DESCRIPTION: Creates a white rectangular region at (199, 12) spanning 113 by 107 pixels.
; PLAN: r0=199(x), r1=12(y), r2=113(width), r3=107(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 12
LDI r2, 113
LDI r3, 107
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
