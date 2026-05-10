; DESCRIPTION: Composite: Renders a orange disk with center (189, 166) and radius 31 then Draws a cyan rectangle at (186, 4) with width 68 and height 71 then Renders a purple line between points (61, 87) and (270, 32).
; PLAN: r0=189(x), r1=166(y), r2=31(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=186(x), r6=4(y), r7=68(width), r8=71(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=61(x1), r11=87(y1), r12=270(x2), r13=32(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 189
LDI r1, 166
LDI r2, 31
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 186
LDI r6, 4
LDI r7, 68
LDI r8, 71
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 61
LDI r11, 87
LDI r12, 270
LDI r13, 32
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
