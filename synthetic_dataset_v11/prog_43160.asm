; DESCRIPTION: Creates a white rectangular region at (70, 106) spanning 11 by 72 pixels.
; PLAN: r0=70(x), r1=106(y), r2=11(width), r3=72(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 106
LDI r2, 11
LDI r3, 72
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
