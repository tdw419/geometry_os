; DESCRIPTION: Composite: Draws a purple rectangle at (264, 138) with width 102 and height 15 then Draws a yellow line from (168, 204) to (450, 237) then Sets a single purple pixel at (266, 91).
; PLAN: r0=264(x), r1=138(y), r2=102(width), r3=15(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=168(x1), r6=204(y1), r7=450(x2), r8=237(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=266(x), r11=91(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 264
LDI r1, 138
LDI r2, 102
LDI r3, 15
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 168
LDI r6, 204
LDI r7, 450
LDI r8, 237
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 266
LDI r11, 91
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
