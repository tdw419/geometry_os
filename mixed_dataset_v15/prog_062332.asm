; DESCRIPTION: Composite: Creates a purple rectangular region at (29, 37) spanning 82 by 97 pixels then Places a red circle of radius 76 at center (313, 106).
; PLAN: r0=29(x), r1=37(y), r2=82(width), r3=97(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=313(x), r6=106(y), r7=76(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 29
LDI r1, 37
LDI r2, 82
LDI r3, 97
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 313
LDI r6, 106
LDI r7, 76
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
