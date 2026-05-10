; DESCRIPTION: Composite: Renders a yellow box of size 40x22 starting at (177, 93) then Draws a magenta line from (356, 195) to (280, 132) then Renders a purple disk with center (183, 72) and radius 26.
; PLAN: r0=177(x), r1=93(y), r2=40(width), r3=22(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=356(x1), r6=195(y1), r7=280(x2), r8=132(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=183(x), r11=72(y), r12=26(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 177
LDI r1, 93
LDI r2, 40
LDI r3, 22
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 356
LDI r6, 195
LDI r7, 280
LDI r8, 132
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 183
LDI r11, 72
LDI r12, 26
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
