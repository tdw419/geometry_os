; DESCRIPTION: Composite: Renders a red line between points (342, 104) and (83, 168) then Creates a white rectangular region at (278, 53) spanning 105 by 44 pixels.
; PLAN: r0=342(x1), r1=104(y1), r2=83(x2), r3=168(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=278(x), r6=53(y), r7=105(width), r8=44(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 342
LDI r1, 104
LDI r2, 83
LDI r3, 168
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 278
LDI r6, 53
LDI r7, 105
LDI r8, 44
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
