; DESCRIPTION: Creates a yellow rectangular region at (416, 144) spanning 55 by 82 pixels.
; PLAN: r0=416(x), r1=144(y), r2=55(width), r3=82(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 144
LDI r2, 55
LDI r3, 82
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
