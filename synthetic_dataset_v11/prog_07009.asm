; DESCRIPTION: Creates a black rectangular region at (27, 73) spanning 116 by 83 pixels.
; PLAN: r0=27(x), r1=73(y), r2=116(width), r3=83(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 73
LDI r2, 116
LDI r3, 83
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
