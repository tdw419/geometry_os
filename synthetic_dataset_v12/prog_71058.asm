; DESCRIPTION: Creates a black rectangular region at (291, 157) spanning 92 by 40 pixels.
; PLAN: r0=291(x), r1=157(y), r2=92(width), r3=40(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 157
LDI r2, 92
LDI r3, 40
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
