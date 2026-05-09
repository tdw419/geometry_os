; DESCRIPTION: Creates a yellow rectangular region at (139, 47) spanning 12 by 105 pixels.
; PLAN: r0=139(x), r1=47(y), r2=12(width), r3=105(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 47
LDI r2, 12
LDI r3, 105
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
