; DESCRIPTION: Composite: Places a yellow circle of radius 67 at center (261, 160) then Draws a blue line from (169, 249) to (278, 197).
; PLAN: r0=261(x), r1=160(y), r2=67(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=169(x1), r6=249(y1), r7=278(x2), r8=197(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 261
LDI r1, 160
LDI r2, 67
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 169
LDI r6, 249
LDI r7, 278
LDI r8, 197
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
