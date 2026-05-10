; DESCRIPTION: Creates a white rectangular region at (290, 181) spanning 49 by 73 pixels.
; PLAN: r0=290(x), r1=181(y), r2=49(width), r3=73(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 181
LDI r2, 49
LDI r3, 73
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
