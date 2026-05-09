; DESCRIPTION: Creates a black rectangular region at (108, 232) spanning 59 by 19 pixels.
; PLAN: r0=108(x), r1=232(y), r2=59(width), r3=19(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 232
LDI r2, 59
LDI r3, 19
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
