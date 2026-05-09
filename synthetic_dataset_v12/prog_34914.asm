; DESCRIPTION: Creates a black rectangular region at (236, 96) spanning 11 by 46 pixels.
; PLAN: r0=236(x), r1=96(y), r2=11(width), r3=46(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 96
LDI r2, 11
LDI r3, 46
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
