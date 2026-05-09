; DESCRIPTION: Creates a black rectangular region at (165, 19) spanning 29 by 113 pixels.
; PLAN: r0=165(x), r1=19(y), r2=29(width), r3=113(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 19
LDI r2, 29
LDI r3, 113
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
