; DESCRIPTION: Composite: Places a green circle of radius 37 at center (332, 217) then Draws a yellow line from (85, 213) to (285, 19).
; PLAN: r0=332(x), r1=217(y), r2=37(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=85(x1), r6=213(y1), r7=285(x2), r8=19(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 332
LDI r1, 217
LDI r2, 37
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 85
LDI r6, 213
LDI r7, 285
LDI r8, 19
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
