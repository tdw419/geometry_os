; DESCRIPTION: Creates a red rectangular region at (44, 91) spanning 76 by 108 pixels.
; PLAN: r0=44(x), r1=91(y), r2=76(width), r3=108(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 91
LDI r2, 76
LDI r3, 108
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
