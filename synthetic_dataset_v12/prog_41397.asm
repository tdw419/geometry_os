; DESCRIPTION: Composite: Renders a magenta box of size 112x80 starting at (113, 158) then Draws a cyan line from (142, 77) to (34, 46) then Renders a blue disk with center (177, 46) and radius 32.
; PLAN: r0=113(x), r1=158(y), r2=112(width), r3=80(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=142(x1), r6=77(y1), r7=34(x2), r8=46(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=177(x), r11=46(y), r12=32(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 113
LDI r1, 158
LDI r2, 112
LDI r3, 80
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 142
LDI r6, 77
LDI r7, 34
LDI r8, 46
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 177
LDI r11, 46
LDI r12, 32
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
