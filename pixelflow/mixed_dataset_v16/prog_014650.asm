; DESCRIPTION: Creates a black rectangular region at (315, 29) spanning 73 by 55 pixels.
; PLAN: r0=315(x), r1=29(y), r2=73(width), r3=55(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 29
LDI r2, 73
LDI r3, 55
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
