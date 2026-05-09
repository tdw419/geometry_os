; DESCRIPTION: Composite: Renders a magenta disk with center (198, 145) and radius 26 then Places a white line segment connecting (194, 127) to (404, 247).
; PLAN: r0=198(x), r1=145(y), r2=26(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=194(x1), r6=127(y1), r7=404(x2), r8=247(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 198
LDI r1, 145
LDI r2, 26
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 194
LDI r6, 127
LDI r7, 404
LDI r8, 247
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
