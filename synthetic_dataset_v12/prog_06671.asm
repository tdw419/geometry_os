; DESCRIPTION: Creates a black rectangular region at (81, 103) spanning 20 by 58 pixels.
; PLAN: r0=81(x), r1=103(y), r2=20(width), r3=58(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 103
LDI r2, 20
LDI r3, 58
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
