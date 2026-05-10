; DESCRIPTION: Creates a white rectangular region at (326, 113) spanning 65 by 100 pixels.
; PLAN: r0=326(x), r1=113(y), r2=65(width), r3=100(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 113
LDI r2, 65
LDI r3, 100
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
