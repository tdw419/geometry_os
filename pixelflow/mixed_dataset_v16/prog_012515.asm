; DESCRIPTION: Composite: Renders a yellow line between points (221, 46) and (19, 147) then Draws a yellow rectangle at (151, 27) with width 90 and height 106.
; PLAN: r0=221(x1), r1=46(y1), r2=19(x2), r3=147(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=151(x), r6=27(y), r7=90(width), r8=106(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 221
LDI r1, 46
LDI r2, 19
LDI r3, 147
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 151
LDI r6, 27
LDI r7, 90
LDI r8, 106
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
