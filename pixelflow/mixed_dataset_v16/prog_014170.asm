; DESCRIPTION: Composite: Draws a cyan rectangle at (198, 104) with width 106 and height 13 then Draws a cyan line from (14, 36) to (17, 50).
; PLAN: r0=198(x), r1=104(y), r2=106(width), r3=13(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=14(x1), r6=36(y1), r7=17(x2), r8=50(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 198
LDI r1, 104
LDI r2, 106
LDI r3, 13
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 14
LDI r6, 36
LDI r7, 17
LDI r8, 50
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
