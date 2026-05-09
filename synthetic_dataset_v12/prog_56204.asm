; DESCRIPTION: Composite: Renders a green box of size 81x82 starting at (278, 97) then Draws a cyan line from (266, 104) to (373, 59).
; PLAN: r0=278(x), r1=97(y), r2=81(width), r3=82(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=266(x1), r6=104(y1), r7=373(x2), r8=59(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 278
LDI r1, 97
LDI r2, 81
LDI r3, 82
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 266
LDI r6, 104
LDI r7, 373
LDI r8, 59
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
