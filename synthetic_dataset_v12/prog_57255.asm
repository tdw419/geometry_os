; DESCRIPTION: Creates a black rectangular region at (99, 128) spanning 117 by 116 pixels.
; PLAN: r0=99(x), r1=128(y), r2=117(width), r3=116(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 128
LDI r2, 117
LDI r3, 116
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
