; DESCRIPTION: Creates a red rectangular region at (19, 43) spanning 108 by 59 pixels.
; PLAN: r0=19(x), r1=43(y), r2=108(width), r3=59(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 43
LDI r2, 108
LDI r3, 59
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
