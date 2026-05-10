; DESCRIPTION: Creates a black rectangular region at (131, 113) spanning 71 by 61 pixels.
; PLAN: r0=131(x), r1=113(y), r2=71(width), r3=61(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 113
LDI r2, 71
LDI r3, 61
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
