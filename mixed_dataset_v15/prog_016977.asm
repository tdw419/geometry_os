; DESCRIPTION: Creates a red rectangular region at (59, 198) spanning 13 by 47 pixels.
; PLAN: r0=59(x), r1=198(y), r2=13(width), r3=47(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 198
LDI r2, 13
LDI r3, 47
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
