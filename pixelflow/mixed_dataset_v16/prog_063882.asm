; DESCRIPTION: Creates a black rectangular region at (408, 37) spanning 38 by 17 pixels.
; PLAN: r0=408(x), r1=37(y), r2=38(width), r3=17(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 37
LDI r2, 38
LDI r3, 17
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
