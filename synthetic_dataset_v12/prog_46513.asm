; DESCRIPTION: Creates a black rectangular region at (473, 112) spanning 34 by 31 pixels.
; PLAN: r0=473(x), r1=112(y), r2=34(width), r3=31(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 112
LDI r2, 34
LDI r3, 31
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
