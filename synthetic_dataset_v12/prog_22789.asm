; DESCRIPTION: Composite: Draws a orange line from (7, 78) to (478, 129) then Sets a single purple pixel at (48, 225) then Draws a orange rectangle at (267, 100) with width 42 and height 117.
; PLAN: r0=7(x1), r1=78(y1), r2=478(x2), r3=129(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=48(x), r6=225(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=267(x), r11=100(y), r12=42(width), r13=117(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 7
LDI r1, 78
LDI r2, 478
LDI r3, 129
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 48
LDI r6, 225
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 267
LDI r11, 100
LDI r12, 42
LDI r13, 117
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
