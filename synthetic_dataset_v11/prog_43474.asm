; DESCRIPTION: Creates a white rectangular region at (123, 95) spanning 35 by 102 pixels.
; PLAN: r0=123(x), r1=95(y), r2=35(width), r3=102(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 95
LDI r2, 35
LDI r3, 102
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
