; DESCRIPTION: Creates a black rectangular region at (93, 135) spanning 116 by 86 pixels.
; PLAN: r0=93(x), r1=135(y), r2=116(width), r3=86(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 135
LDI r2, 116
LDI r3, 86
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
