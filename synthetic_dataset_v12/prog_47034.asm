; DESCRIPTION: Composite: Renders a blue line between points (134, 204) and (345, 145) then Renders a black box of size 22x19 starting at (114, 12) then Places a red circle of radius 63 at center (342, 151).
; PLAN: r0=134(x1), r1=204(y1), r2=345(x2), r3=145(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=114(x), r6=12(y), r7=22(width), r8=19(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=342(x), r11=151(y), r12=63(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 134
LDI r1, 204
LDI r2, 345
LDI r3, 145
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 114
LDI r6, 12
LDI r7, 22
LDI r8, 19
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 342
LDI r11, 151
LDI r12, 63
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
