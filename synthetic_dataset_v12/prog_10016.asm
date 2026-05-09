; DESCRIPTION: Composite: Draws a cyan circle centered at (217, 136) with radius 36 then Places a green line segment connecting (198, 240) to (15, 225).
; PLAN: r0=217(x), r1=136(y), r2=36(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=198(x1), r6=240(y1), r7=15(x2), r8=225(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 217
LDI r1, 136
LDI r2, 36
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 198
LDI r6, 240
LDI r7, 15
LDI r8, 225
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
