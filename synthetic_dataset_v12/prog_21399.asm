; DESCRIPTION: Creates a black rectangular region at (6, 141) spanning 98 by 92 pixels.
; PLAN: r0=6(x), r1=141(y), r2=98(width), r3=92(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 141
LDI r2, 98
LDI r3, 92
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
