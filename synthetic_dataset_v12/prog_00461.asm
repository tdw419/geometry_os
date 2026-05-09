; DESCRIPTION: Creates a black rectangular region at (361, 103) spanning 102 by 100 pixels.
; PLAN: r0=361(x), r1=103(y), r2=102(width), r3=100(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 103
LDI r2, 102
LDI r3, 100
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
