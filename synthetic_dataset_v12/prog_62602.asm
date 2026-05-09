; DESCRIPTION: Creates a black rectangular region at (301, 4) spanning 71 by 61 pixels.
; PLAN: r0=301(x), r1=4(y), r2=71(width), r3=61(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 4
LDI r2, 71
LDI r3, 61
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
