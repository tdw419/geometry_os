; DESCRIPTION: Composite: Draws a yellow line from (349, 233) to (206, 65) then Creates a blue circular shape at (269, 182) with radius 28.
; PLAN: r0=349(x1), r1=233(y1), r2=206(x2), r3=65(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=269(x), r6=182(y), r7=28(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 349
LDI r1, 233
LDI r2, 206
LDI r3, 65
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 269
LDI r6, 182
LDI r7, 28
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
