; DESCRIPTION: Creates a red rectangular region at (14, 98) spanning 108 by 55 pixels.
; PLAN: r0=14(x), r1=98(y), r2=108(width), r3=55(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 98
LDI r2, 108
LDI r3, 55
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
