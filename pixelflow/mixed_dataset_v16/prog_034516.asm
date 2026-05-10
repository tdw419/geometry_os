; DESCRIPTION: Creates a black rectangular region at (349, 106) spanning 24 by 57 pixels.
; PLAN: r0=349(x), r1=106(y), r2=24(width), r3=57(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 106
LDI r2, 24
LDI r3, 57
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
