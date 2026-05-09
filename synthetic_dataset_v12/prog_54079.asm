; DESCRIPTION: Creates a white rectangular region at (22, 142) spanning 58 by 70 pixels.
; PLAN: r0=22(x), r1=142(y), r2=58(width), r3=70(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 142
LDI r2, 58
LDI r3, 70
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
