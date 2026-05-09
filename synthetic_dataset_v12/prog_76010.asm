; DESCRIPTION: Creates a black rectangular region at (110, 47) spanning 116 by 13 pixels.
; PLAN: r0=110(x), r1=47(y), r2=116(width), r3=13(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 47
LDI r2, 116
LDI r3, 13
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
