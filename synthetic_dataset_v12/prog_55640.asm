; DESCRIPTION: Creates a white rectangular region at (37, 141) spanning 35 by 109 pixels.
; PLAN: r0=37(x), r1=141(y), r2=35(width), r3=109(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 141
LDI r2, 35
LDI r3, 109
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
