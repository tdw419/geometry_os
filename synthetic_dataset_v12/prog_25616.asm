; DESCRIPTION: Creates a black rectangular region at (414, 135) spanning 47 by 50 pixels.
; PLAN: r0=414(x), r1=135(y), r2=47(width), r3=50(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 135
LDI r2, 47
LDI r3, 50
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
