; DESCRIPTION: Creates a white rectangular region at (339, 53) spanning 117 by 37 pixels.
; PLAN: r0=339(x), r1=53(y), r2=117(width), r3=37(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 53
LDI r2, 117
LDI r3, 37
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
