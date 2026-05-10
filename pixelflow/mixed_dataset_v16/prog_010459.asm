; DESCRIPTION: Creates a black rectangular region at (221, 77) spanning 83 by 45 pixels.
; PLAN: r0=221(x), r1=77(y), r2=83(width), r3=45(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 77
LDI r2, 83
LDI r3, 45
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
