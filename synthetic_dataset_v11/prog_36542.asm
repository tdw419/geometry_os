; DESCRIPTION: Creates a white rectangular region at (13, 134) spanning 101 by 115 pixels.
; PLAN: r0=13(x), r1=134(y), r2=101(width), r3=115(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 134
LDI r2, 101
LDI r3, 115
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
