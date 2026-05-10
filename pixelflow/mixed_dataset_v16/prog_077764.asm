; DESCRIPTION: Composite: Places a white circle of radius 32 at center (447, 214) then Places a yellow line segment connecting (324, 82) to (158, 225).
; PLAN: r0=447(x), r1=214(y), r2=32(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=324(x1), r6=82(y1), r7=158(x2), r8=225(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 447
LDI r1, 214
LDI r2, 32
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 324
LDI r6, 82
LDI r7, 158
LDI r8, 225
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
