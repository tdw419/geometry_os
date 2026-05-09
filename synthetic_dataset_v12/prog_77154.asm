; DESCRIPTION: Composite: Places a yellow line segment connecting (435, 231) to (213, 85) then Creates a black circular shape at (114, 187) with radius 64.
; PLAN: r0=435(x1), r1=231(y1), r2=213(x2), r3=85(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=114(x), r6=187(y), r7=64(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 435
LDI r1, 231
LDI r2, 213
LDI r3, 85
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 114
LDI r6, 187
LDI r7, 64
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
