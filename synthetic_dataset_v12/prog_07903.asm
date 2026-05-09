; DESCRIPTION: Creates a red rectangular region at (83, 37) spanning 19 by 119 pixels.
; PLAN: r0=83(x), r1=37(y), r2=19(width), r3=119(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 37
LDI r2, 19
LDI r3, 119
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
