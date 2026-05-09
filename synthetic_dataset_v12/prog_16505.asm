; DESCRIPTION: Composite: Sets a single green pixel at (123, 236) then Draws a red line from (117, 244) to (241, 93) then Draws a red rectangle at (340, 97) with width 20 and height 80.
; PLAN: r0=123(x), r1=236(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=117(x1), r6=244(y1), r7=241(x2), r8=93(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=340(x), r11=97(y), r12=20(width), r13=80(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 123
LDI r1, 236
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 117
LDI r6, 244
LDI r7, 241
LDI r8, 93
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 340
LDI r11, 97
LDI r12, 20
LDI r13, 80
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
