; DESCRIPTION: Creates a red rectangular region at (55, 138) spanning 35 by 37 pixels.
; PLAN: r0=55(x), r1=138(y), r2=35(width), r3=37(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 138
LDI r2, 35
LDI r3, 37
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
