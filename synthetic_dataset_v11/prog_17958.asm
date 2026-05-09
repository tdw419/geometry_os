; DESCRIPTION: Creates a white rectangular region at (95, 65) spanning 31 by 44 pixels.
; PLAN: r0=95(x), r1=65(y), r2=31(width), r3=44(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 65
LDI r2, 31
LDI r3, 44
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
