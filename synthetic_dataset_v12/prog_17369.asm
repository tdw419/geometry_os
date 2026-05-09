; DESCRIPTION: Creates a black rectangular region at (40, 33) spanning 29 by 36 pixels.
; PLAN: r0=40(x), r1=33(y), r2=29(width), r3=36(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 33
LDI r2, 29
LDI r3, 36
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
