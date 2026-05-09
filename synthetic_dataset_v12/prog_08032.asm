; DESCRIPTION: Creates a black rectangular region at (35, 54) spanning 71 by 40 pixels.
; PLAN: r0=35(x), r1=54(y), r2=71(width), r3=40(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 54
LDI r2, 71
LDI r3, 40
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
