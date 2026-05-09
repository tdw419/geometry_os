; DESCRIPTION: Creates a white rectangular region at (252, 141) spanning 58 by 13 pixels.
; PLAN: r0=252(x), r1=141(y), r2=58(width), r3=13(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 141
LDI r2, 58
LDI r3, 13
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
