; DESCRIPTION: Composite: Places a blue circle of radius 74 at center (281, 144) then Renders a green line between points (474, 232) and (400, 88).
; PLAN: r0=281(x), r1=144(y), r2=74(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=474(x1), r6=232(y1), r7=400(x2), r8=88(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 281
LDI r1, 144
LDI r2, 74
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 474
LDI r6, 232
LDI r7, 400
LDI r8, 88
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
