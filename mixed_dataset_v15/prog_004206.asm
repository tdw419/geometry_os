; DESCRIPTION: Composite: Renders a red disk with center (36, 39) and radius 33 then Draws a cyan line from (154, 229) to (342, 11) then Draws a orange rectangle at (3, 24) with width 83 and height 115.
; PLAN: r0=36(x), r1=39(y), r2=33(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=154(x1), r6=229(y1), r7=342(x2), r8=11(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=3(x), r11=24(y), r12=83(width), r13=115(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 36
LDI r1, 39
LDI r2, 33
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 154
LDI r6, 229
LDI r7, 342
LDI r8, 11
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 3
LDI r11, 24
LDI r12, 83
LDI r13, 115
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
