; DESCRIPTION: Composite: Renders a green disk with center (89, 127) and radius 75 then Draws a yellow line from (151, 7) to (102, 58) then Creates a white rectangular region at (391, 93) spanning 24 by 57 pixels.
; PLAN: r0=89(x), r1=127(y), r2=75(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=151(x1), r6=7(y1), r7=102(x2), r8=58(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=391(x), r11=93(y), r12=24(width), r13=57(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 89
LDI r1, 127
LDI r2, 75
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 151
LDI r6, 7
LDI r7, 102
LDI r8, 58
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 391
LDI r11, 93
LDI r12, 24
LDI r13, 57
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
