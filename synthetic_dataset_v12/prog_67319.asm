; DESCRIPTION: Creates a black rectangular region at (375, 113) spanning 78 by 79 pixels.
; PLAN: r0=375(x), r1=113(y), r2=78(width), r3=79(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 113
LDI r2, 78
LDI r3, 79
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
