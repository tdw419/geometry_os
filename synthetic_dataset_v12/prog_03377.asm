; DESCRIPTION: Creates a white rectangular region at (361, 106) spanning 57 by 13 pixels.
; PLAN: r0=361(x), r1=106(y), r2=57(width), r3=13(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 106
LDI r2, 57
LDI r3, 13
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
