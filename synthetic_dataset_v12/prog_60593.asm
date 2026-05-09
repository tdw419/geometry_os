; DESCRIPTION: Creates a black rectangular region at (240, 92) spanning 73 by 74 pixels.
; PLAN: r0=240(x), r1=92(y), r2=73(width), r3=74(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 92
LDI r2, 73
LDI r3, 74
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
