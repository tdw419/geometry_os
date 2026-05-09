; DESCRIPTION: Creates a black rectangular region at (47, 120) spanning 35 by 116 pixels.
; PLAN: r0=47(x), r1=120(y), r2=35(width), r3=116(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 120
LDI r2, 35
LDI r3, 116
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
