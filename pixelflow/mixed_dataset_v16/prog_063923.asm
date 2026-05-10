; DESCRIPTION: Composite: Renders a magenta disk with center (264, 179) and radius 74 then Draws a blue line from (137, 127) to (99, 119).
; PLAN: r0=264(x), r1=179(y), r2=74(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=137(x1), r6=127(y1), r7=99(x2), r8=119(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 264
LDI r1, 179
LDI r2, 74
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 137
LDI r6, 127
LDI r7, 99
LDI r8, 119
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
