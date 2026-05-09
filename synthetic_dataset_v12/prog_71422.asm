; DESCRIPTION: Creates a black rectangular region at (24, 145) spanning 109 by 33 pixels.
; PLAN: r0=24(x), r1=145(y), r2=109(width), r3=33(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 145
LDI r2, 109
LDI r3, 33
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
