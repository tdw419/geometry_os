; DESCRIPTION: Composite: Places a blue circle of radius 21 at center (415, 71) then Renders a black line between points (347, 111) and (262, 26).
; PLAN: r0=415(x), r1=71(y), r2=21(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=347(x1), r6=111(y1), r7=262(x2), r8=26(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 415
LDI r1, 71
LDI r2, 21
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 347
LDI r6, 111
LDI r7, 262
LDI r8, 26
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
