; DESCRIPTION: Creates a white rectangular region at (112, 6) spanning 58 by 75 pixels.
; PLAN: r0=112(x), r1=6(y), r2=58(width), r3=75(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 6
LDI r2, 58
LDI r3, 75
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
