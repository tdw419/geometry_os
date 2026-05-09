; DESCRIPTION: Composite: Draws a blue line from (303, 122) to (358, 37) then Places a magenta dot at position (188, 164) then Places a red circle of radius 36 at center (105, 197).
; PLAN: r0=303(x1), r1=122(y1), r2=358(x2), r3=37(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=188(x), r6=164(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=105(x), r11=197(y), r12=36(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 303
LDI r1, 122
LDI r2, 358
LDI r3, 37
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 188
LDI r6, 164
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 105
LDI r11, 197
LDI r12, 36
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
