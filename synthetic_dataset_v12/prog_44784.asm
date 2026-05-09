; DESCRIPTION: Creates a black rectangular region at (414, 178) spanning 38 by 57 pixels.
; PLAN: r0=414(x), r1=178(y), r2=38(width), r3=57(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 178
LDI r2, 38
LDI r3, 57
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
