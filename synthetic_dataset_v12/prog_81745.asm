; DESCRIPTION: Composite: Renders a magenta disk with center (374, 176) and radius 25 then Renders a magenta box of size 92x18 starting at (221, 7) then Draws a blue line from (169, 74) to (188, 225).
; PLAN: r0=374(x), r1=176(y), r2=25(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=221(x), r6=7(y), r7=92(width), r8=18(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=169(x1), r11=74(y1), r12=188(x2), r13=225(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 374
LDI r1, 176
LDI r2, 25
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 221
LDI r6, 7
LDI r7, 92
LDI r8, 18
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 169
LDI r11, 74
LDI r12, 188
LDI r13, 225
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
