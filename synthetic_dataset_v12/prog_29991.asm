; DESCRIPTION: Creates a black rectangular region at (38, 190) spanning 34 by 39 pixels.
; PLAN: r0=38(x), r1=190(y), r2=34(width), r3=39(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 190
LDI r2, 34
LDI r3, 39
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
