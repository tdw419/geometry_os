; DESCRIPTION: Composite: Creates a cyan circular shape at (298, 126) with radius 17 then Renders a cyan line between points (127, 28) and (207, 71) then Draws a black rectangle at (306, 169) with width 79 and height 84.
; PLAN: r0=298(x), r1=126(y), r2=17(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=127(x1), r6=28(y1), r7=207(x2), r8=71(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=306(x), r11=169(y), r12=79(width), r13=84(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 298
LDI r1, 126
LDI r2, 17
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 127
LDI r6, 28
LDI r7, 207
LDI r8, 71
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 306
LDI r11, 169
LDI r12, 79
LDI r13, 84
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
