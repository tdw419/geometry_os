; DESCRIPTION: Creates a black rectangular region at (486, 33) spanning 25 by 34 pixels.
; PLAN: r0=486(x), r1=33(y), r2=25(width), r3=34(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 33
LDI r2, 25
LDI r3, 34
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
