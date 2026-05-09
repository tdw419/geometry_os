; DESCRIPTION: Composite: Sets a single orange pixel at (130, 64) then Draws a white line from (509, 14) to (46, 22) then Draws a purple rectangle at (428, 11) with width 12 and height 80.
; PLAN: r0=130(x), r1=64(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=509(x1), r6=14(y1), r7=46(x2), r8=22(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=428(x), r11=11(y), r12=12(width), r13=80(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 130
LDI r1, 64
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 509
LDI r6, 14
LDI r7, 46
LDI r8, 22
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 428
LDI r11, 11
LDI r12, 12
LDI r13, 80
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
