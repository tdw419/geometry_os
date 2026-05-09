; DESCRIPTION: Creates a black rectangular region at (360, 122) spanning 80 by 95 pixels.
; PLAN: r0=360(x), r1=122(y), r2=80(width), r3=95(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 122
LDI r2, 80
LDI r3, 95
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
