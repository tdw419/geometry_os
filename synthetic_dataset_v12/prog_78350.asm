; DESCRIPTION: Creates a white rectangular region at (328, 75) spanning 115 by 15 pixels.
; PLAN: r0=328(x), r1=75(y), r2=115(width), r3=15(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 75
LDI r2, 115
LDI r3, 15
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
