; DESCRIPTION: Composite: Draws a cyan rectangle at (17, 139) with width 104 and height 14 then Draws a cyan line from (482, 178) to (169, 135).
; PLAN: r0=17(x), r1=139(y), r2=104(width), r3=14(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=482(x1), r6=178(y1), r7=169(x2), r8=135(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 17
LDI r1, 139
LDI r2, 104
LDI r3, 14
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 482
LDI r6, 178
LDI r7, 169
LDI r8, 135
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
