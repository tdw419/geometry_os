; DESCRIPTION: Creates a yellow rectangular region at (320, 34) spanning 90 by 55 pixels.
; PLAN: r0=320(x), r1=34(y), r2=90(width), r3=55(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 34
LDI r2, 90
LDI r3, 55
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
