; DESCRIPTION: Composite: Places a black circle of radius 25 at center (188, 153) then Draws a yellow line from (19, 133) to (179, 177).
; PLAN: r0=188(x), r1=153(y), r2=25(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=19(x1), r6=133(y1), r7=179(x2), r8=177(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 188
LDI r1, 153
LDI r2, 25
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 19
LDI r6, 133
LDI r7, 179
LDI r8, 177
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
