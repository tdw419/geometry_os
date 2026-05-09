; DESCRIPTION: Creates a black rectangular region at (3, 30) spanning 119 by 59 pixels.
; PLAN: r0=3(x), r1=30(y), r2=119(width), r3=59(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 30
LDI r2, 119
LDI r3, 59
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
