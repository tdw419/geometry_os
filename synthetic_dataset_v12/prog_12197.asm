; DESCRIPTION: Creates a black rectangular region at (95, 181) spanning 33 by 19 pixels.
; PLAN: r0=95(x), r1=181(y), r2=33(width), r3=19(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 181
LDI r2, 33
LDI r3, 19
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
