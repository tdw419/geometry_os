; DESCRIPTION: Composite: Draws a purple line from (457, 35) to (306, 24) then Places a green circle of radius 70 at center (218, 149).
; PLAN: r0=457(x1), r1=35(y1), r2=306(x2), r3=24(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=218(x), r6=149(y), r7=70(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 457
LDI r1, 35
LDI r2, 306
LDI r3, 24
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 218
LDI r6, 149
LDI r7, 70
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
