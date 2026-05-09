; DESCRIPTION: Composite: Renders a green box of size 106x81 starting at (77, 80) then Sets a single magenta pixel at (203, 10) then Draws a purple line from (208, 252) to (124, 220).
; PLAN: r0=77(x), r1=80(y), r2=106(width), r3=81(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=203(x), r6=10(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=208(x1), r11=252(y1), r12=124(x2), r13=220(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 77
LDI r1, 80
LDI r2, 106
LDI r3, 81
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 203
LDI r6, 10
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 208
LDI r11, 252
LDI r12, 124
LDI r13, 220
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
