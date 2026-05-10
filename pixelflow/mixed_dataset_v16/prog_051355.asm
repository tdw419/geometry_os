; DESCRIPTION: Composite: Places a white circle of radius 17 at center (108, 113) then Draws a blue line from (264, 158) to (422, 128).
; PLAN: r0=108(x), r1=113(y), r2=17(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=264(x1), r6=158(y1), r7=422(x2), r8=128(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 108
LDI r1, 113
LDI r2, 17
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 264
LDI r6, 158
LDI r7, 422
LDI r8, 128
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
