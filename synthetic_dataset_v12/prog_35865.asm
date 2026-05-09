; DESCRIPTION: Creates a purple rectangular region at (187, 138) spanning 38 by 78 pixels.
; PLAN: r0=187(x), r1=138(y), r2=38(width), r3=78(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 138
LDI r2, 38
LDI r3, 78
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
