; DESCRIPTION: Creates a yellow rectangular region at (122, 15) spanning 92 by 103 pixels.
; PLAN: r0=122(x), r1=15(y), r2=92(width), r3=103(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 15
LDI r2, 92
LDI r3, 103
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
