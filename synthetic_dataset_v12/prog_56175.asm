; DESCRIPTION: Creates a white rectangular region at (37, 101) spanning 39 by 29 pixels.
; PLAN: r0=37(x), r1=101(y), r2=39(width), r3=29(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 101
LDI r2, 39
LDI r3, 29
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
