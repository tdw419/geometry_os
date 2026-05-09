; DESCRIPTION: Creates a white rectangular region at (207, 115) spanning 70 by 118 pixels.
; PLAN: r0=207(x), r1=115(y), r2=70(width), r3=118(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 115
LDI r2, 70
LDI r3, 118
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
