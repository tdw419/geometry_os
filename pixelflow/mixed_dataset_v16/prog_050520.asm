; DESCRIPTION: Composite: Places a purple circle of radius 53 at center (202, 121) then Creates a magenta rectangular region at (427, 57) spanning 75 by 47 pixels.
; PLAN: r0=202(x), r1=121(y), r2=53(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=427(x), r6=57(y), r7=75(width), r8=47(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 202
LDI r1, 121
LDI r2, 53
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 427
LDI r6, 57
LDI r7, 75
LDI r8, 47
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
