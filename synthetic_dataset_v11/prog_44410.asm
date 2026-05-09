; DESCRIPTION: Creates a black rectangular region at (38, 195) spanning 108 by 47 pixels.
; PLAN: r0=38(x), r1=195(y), r2=108(width), r3=47(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 195
LDI r2, 108
LDI r3, 47
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
