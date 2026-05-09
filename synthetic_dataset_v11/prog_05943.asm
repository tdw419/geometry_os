; DESCRIPTION: Creates a black rectangular region at (72, 5) spanning 112 by 101 pixels.
; PLAN: r0=72(x), r1=5(y), r2=112(width), r3=101(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 5
LDI r2, 112
LDI r3, 101
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
