; DESCRIPTION: Creates a white rectangular region at (113, 119) spanning 17 by 17 pixels.
; PLAN: r0=113(x), r1=119(y), r2=17(width), r3=17(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 119
LDI r2, 17
LDI r3, 17
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
