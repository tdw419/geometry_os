; DESCRIPTION: Creates a black rectangular region at (400, 135) spanning 46 by 71 pixels.
; PLAN: r0=400(x), r1=135(y), r2=46(width), r3=71(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 135
LDI r2, 46
LDI r3, 71
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
