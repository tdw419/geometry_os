; DESCRIPTION: Composite: Renders a black box of size 57x45 starting at (387, 53) then Draws a yellow line from (373, 45) to (233, 204) then Renders a green disk with center (105, 134) and radius 46.
; PLAN: r0=387(x), r1=53(y), r2=57(width), r3=45(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=373(x1), r6=45(y1), r7=233(x2), r8=204(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=105(x), r11=134(y), r12=46(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 387
LDI r1, 53
LDI r2, 57
LDI r3, 45
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 373
LDI r6, 45
LDI r7, 233
LDI r8, 204
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 105
LDI r11, 134
LDI r12, 46
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
