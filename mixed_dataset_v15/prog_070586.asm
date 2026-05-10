; DESCRIPTION: Creates a black rectangular region at (19, 60) spanning 115 by 47 pixels.
; PLAN: r0=19(x), r1=60(y), r2=115(width), r3=47(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 60
LDI r2, 115
LDI r3, 47
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
