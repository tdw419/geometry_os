; DESCRIPTION: Creates a black rectangular region at (124, 98) spanning 106 by 36 pixels.
; PLAN: r0=124(x), r1=98(y), r2=106(width), r3=36(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 98
LDI r2, 106
LDI r3, 36
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
