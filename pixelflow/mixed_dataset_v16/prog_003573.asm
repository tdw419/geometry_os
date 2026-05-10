; DESCRIPTION: Composite: Draws a yellow line from (61, 154) to (116, 139) then Draws a green circle centered at (435, 61) with radius 49.
; PLAN: r0=61(x1), r1=154(y1), r2=116(x2), r3=139(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=435(x), r6=61(y), r7=49(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 61
LDI r1, 154
LDI r2, 116
LDI r3, 139
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 435
LDI r6, 61
LDI r7, 49
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
