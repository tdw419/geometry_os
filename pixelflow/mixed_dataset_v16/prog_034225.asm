; DESCRIPTION: Composite: Draws a orange line from (70, 47) to (15, 255) then Draws a blue rectangle at (341, 124) with width 18 and height 82.
; PLAN: r0=70(x1), r1=47(y1), r2=15(x2), r3=255(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=341(x), r6=124(y), r7=18(width), r8=82(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 70
LDI r1, 47
LDI r2, 15
LDI r3, 255
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 341
LDI r6, 124
LDI r7, 18
LDI r8, 82
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
