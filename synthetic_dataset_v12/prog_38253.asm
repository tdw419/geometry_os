; DESCRIPTION: Creates a black rectangular region at (142, 162) spanning 116 by 16 pixels.
; PLAN: r0=142(x), r1=162(y), r2=116(width), r3=16(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 162
LDI r2, 116
LDI r3, 16
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
