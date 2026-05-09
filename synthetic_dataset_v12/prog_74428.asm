; DESCRIPTION: Composite: Places a green circle of radius 67 at center (269, 164) then Draws a yellow line from (132, 49) to (498, 198).
; PLAN: r0=269(x), r1=164(y), r2=67(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=132(x1), r6=49(y1), r7=498(x2), r8=198(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 269
LDI r1, 164
LDI r2, 67
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 132
LDI r6, 49
LDI r7, 498
LDI r8, 198
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
