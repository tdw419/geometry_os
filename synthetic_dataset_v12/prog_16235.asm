; DESCRIPTION: Creates a black rectangular region at (88, 113) spanning 16 by 71 pixels.
; PLAN: r0=88(x), r1=113(y), r2=16(width), r3=71(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 113
LDI r2, 16
LDI r3, 71
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
