; DESCRIPTION: Creates a white rectangular region at (117, 156) spanning 105 by 75 pixels.
; PLAN: r0=117(x), r1=156(y), r2=105(width), r3=75(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 156
LDI r2, 105
LDI r3, 75
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
