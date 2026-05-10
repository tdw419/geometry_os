; DESCRIPTION: Creates a white rectangular region at (197, 62) spanning 75 by 106 pixels.
; PLAN: r0=197(x), r1=62(y), r2=75(width), r3=106(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 62
LDI r2, 75
LDI r3, 106
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
