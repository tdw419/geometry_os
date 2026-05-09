; DESCRIPTION: Creates a black rectangular region at (10, 108) spanning 46 by 77 pixels.
; PLAN: r0=10(x), r1=108(y), r2=46(width), r3=77(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 108
LDI r2, 46
LDI r3, 77
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
