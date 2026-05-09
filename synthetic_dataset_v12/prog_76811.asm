; DESCRIPTION: Composite: Draws a white line from (315, 255) to (334, 71) then Draws a magenta rectangle at (129, 26) with width 104 and height 49.
; PLAN: r0=315(x1), r1=255(y1), r2=334(x2), r3=71(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=129(x), r6=26(y), r7=104(width), r8=49(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 315
LDI r1, 255
LDI r2, 334
LDI r3, 71
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 129
LDI r6, 26
LDI r7, 104
LDI r8, 49
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
