; DESCRIPTION: Creates a white rectangular region at (8, 189) spanning 106 by 23 pixels.
; PLAN: r0=8(x), r1=189(y), r2=106(width), r3=23(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 189
LDI r2, 106
LDI r3, 23
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
