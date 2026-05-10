; DESCRIPTION: Composite: Draws a magenta rectangle at (368, 17) with width 45 and height 83 then Sets a single green pixel at (277, 8) then Renders a purple line between points (54, 154) and (263, 12).
; PLAN: r0=368(x), r1=17(y), r2=45(width), r3=83(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=277(x), r6=8(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=54(x1), r11=154(y1), r12=263(x2), r13=12(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 368
LDI r1, 17
LDI r2, 45
LDI r3, 83
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 277
LDI r6, 8
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 54
LDI r11, 154
LDI r12, 263
LDI r13, 12
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
