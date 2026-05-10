; DESCRIPTION: Composite: Creates a yellow circular shape at (416, 147) with radius 45 then Draws a black line from (239, 230) to (177, 114).
; PLAN: r0=416(x), r1=147(y), r2=45(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=239(x1), r6=230(y1), r7=177(x2), r8=114(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 416
LDI r1, 147
LDI r2, 45
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 239
LDI r6, 230
LDI r7, 177
LDI r8, 114
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
