; DESCRIPTION: Creates a white rectangular region at (5, 117) spanning 60 by 115 pixels.
; PLAN: r0=5(x), r1=117(y), r2=60(width), r3=115(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 117
LDI r2, 60
LDI r3, 115
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
