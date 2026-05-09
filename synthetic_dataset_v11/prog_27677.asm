; DESCRIPTION: Creates a red rectangular region at (90, 125) spanning 83 by 110 pixels.
; PLAN: r0=90(x), r1=125(y), r2=83(width), r3=110(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 125
LDI r2, 83
LDI r3, 110
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
