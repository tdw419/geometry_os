; DESCRIPTION: Creates a white rectangular region at (143, 45) spanning 118 by 58 pixels.
; PLAN: r0=143(x), r1=45(y), r2=118(width), r3=58(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 45
LDI r2, 118
LDI r3, 58
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
