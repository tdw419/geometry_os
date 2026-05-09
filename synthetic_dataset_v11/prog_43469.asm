; DESCRIPTION: Creates a black rectangular region at (141, 5) spanning 45 by 112 pixels.
; PLAN: r0=141(x), r1=5(y), r2=45(width), r3=112(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 5
LDI r2, 45
LDI r3, 112
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
