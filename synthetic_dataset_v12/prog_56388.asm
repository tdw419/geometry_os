; DESCRIPTION: Composite: Draws a yellow circle centered at (215, 120) with radius 49 then Places a blue line segment connecting (52, 36) to (314, 204).
; PLAN: r0=215(x), r1=120(y), r2=49(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=52(x1), r6=36(y1), r7=314(x2), r8=204(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 215
LDI r1, 120
LDI r2, 49
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 52
LDI r6, 36
LDI r7, 314
LDI r8, 204
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
