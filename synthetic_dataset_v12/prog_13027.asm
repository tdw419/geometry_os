; DESCRIPTION: Composite: Sets a single orange pixel at (361, 58) then Draws a blue rectangle at (242, 30) with width 119 and height 111 then Draws a red line from (335, 4) to (477, 178).
; PLAN: r0=361(x), r1=58(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=242(x), r6=30(y), r7=119(width), r8=111(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=335(x1), r11=4(y1), r12=477(x2), r13=178(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 361
LDI r1, 58
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 242
LDI r6, 30
LDI r7, 119
LDI r8, 111
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 335
LDI r11, 4
LDI r12, 477
LDI r13, 178
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
