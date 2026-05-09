; DESCRIPTION: Creates a white rectangular region at (66, 4) spanning 83 by 77 pixels.
; PLAN: r0=66(x), r1=4(y), r2=83(width), r3=77(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 4
LDI r2, 83
LDI r3, 77
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
