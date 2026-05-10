; DESCRIPTION: Creates a white rectangular region at (163, 13) spanning 103 by 89 pixels.
; PLAN: r0=163(x), r1=13(y), r2=103(width), r3=89(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 13
LDI r2, 103
LDI r3, 89
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
