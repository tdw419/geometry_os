; DESCRIPTION: Composite: Renders a purple line between points (450, 166) and (129, 59) then Sets a single green pixel at (116, 87) then Draws a purple rectangle at (30, 96) with width 114 and height 103.
; PLAN: r0=450(x1), r1=166(y1), r2=129(x2), r3=59(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=116(x), r6=87(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=30(x), r11=96(y), r12=114(width), r13=103(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 450
LDI r1, 166
LDI r2, 129
LDI r3, 59
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 116
LDI r6, 87
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 30
LDI r11, 96
LDI r12, 114
LDI r13, 103
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
