; DESCRIPTION: Composite: Draws a red circle centered at (144, 114) with radius 61 then Renders a magenta line between points (50, 138) and (408, 229) then Sets a single red pixel at (253, 233).
; PLAN: r0=144(x), r1=114(y), r2=61(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=50(x1), r6=138(y1), r7=408(x2), r8=229(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=253(x), r11=233(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 144
LDI r1, 114
LDI r2, 61
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 50
LDI r6, 138
LDI r7, 408
LDI r8, 229
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 253
LDI r11, 233
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
