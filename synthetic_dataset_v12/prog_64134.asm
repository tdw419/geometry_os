; DESCRIPTION: Composite: Sets a single black pixel at (280, 236) then Draws a orange rectangle at (134, 162) with width 13 and height 24 then Draws a cyan line from (314, 0) to (361, 120).
; PLAN: r0=280(x), r1=236(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=134(x), r6=162(y), r7=13(width), r8=24(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=314(x1), r11=0(y1), r12=361(x2), r13=120(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 280
LDI r1, 236
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 134
LDI r6, 162
LDI r7, 13
LDI r8, 24
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 314
LDI r11, 0
LDI r12, 361
LDI r13, 120
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
