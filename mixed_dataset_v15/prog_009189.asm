; DESCRIPTION: Creates a black rectangular region at (435, 36) spanning 71 by 18 pixels.
; PLAN: r0=435(x), r1=36(y), r2=71(width), r3=18(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 36
LDI r2, 71
LDI r3, 18
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
