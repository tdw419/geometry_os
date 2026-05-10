; DESCRIPTION: Composite: Places a white dot at position (246, 86) then Draws a green line from (489, 9) to (277, 122) then Places a magenta circle of radius 57 at center (152, 74).
; PLAN: r0=246(x), r1=86(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=489(x1), r6=9(y1), r7=277(x2), r8=122(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=152(x), r11=74(y), r12=57(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 246
LDI r1, 86
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 489
LDI r6, 9
LDI r7, 277
LDI r8, 122
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 152
LDI r11, 74
LDI r12, 57
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
