; DESCRIPTION: Creates a white rectangular region at (318, 220) spanning 101 by 26 pixels.
; PLAN: r0=318(x), r1=220(y), r2=101(width), r3=26(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 220
LDI r2, 101
LDI r3, 26
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
