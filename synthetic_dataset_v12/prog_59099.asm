; DESCRIPTION: Creates a white rectangular region at (139, 7) spanning 72 by 44 pixels.
; PLAN: r0=139(x), r1=7(y), r2=72(width), r3=44(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 7
LDI r2, 72
LDI r3, 44
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
