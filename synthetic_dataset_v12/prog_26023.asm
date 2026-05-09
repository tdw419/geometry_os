; DESCRIPTION: Creates a white rectangular region at (122, 105) spanning 48 by 111 pixels.
; PLAN: r0=122(x), r1=105(y), r2=48(width), r3=111(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 105
LDI r2, 48
LDI r3, 111
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
