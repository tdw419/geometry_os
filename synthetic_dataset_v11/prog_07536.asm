; DESCRIPTION: Creates a yellow rectangular region at (160, 182) spanning 47 by 26 pixels.
; PLAN: r0=160(x), r1=182(y), r2=47(width), r3=26(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 182
LDI r2, 47
LDI r3, 26
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
