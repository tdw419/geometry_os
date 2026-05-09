; DESCRIPTION: Creates a black rectangular region at (133, 30) spanning 103 by 28 pixels.
; PLAN: r0=133(x), r1=30(y), r2=103(width), r3=28(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 30
LDI r2, 103
LDI r3, 28
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
