; DESCRIPTION: Composite: Draws a blue line from (373, 113) to (81, 128) then Renders a black disk with center (388, 111) and radius 75.
; PLAN: r0=373(x1), r1=113(y1), r2=81(x2), r3=128(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=388(x), r6=111(y), r7=75(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 373
LDI r1, 113
LDI r2, 81
LDI r3, 128
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 388
LDI r6, 111
LDI r7, 75
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
