; DESCRIPTION: Composite: Places a magenta circle of radius 32 at center (431, 90) then Renders a purple line between points (421, 0) and (500, 21).
; PLAN: r0=431(x), r1=90(y), r2=32(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=421(x1), r6=0(y1), r7=500(x2), r8=21(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 431
LDI r1, 90
LDI r2, 32
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 421
LDI r6, 0
LDI r7, 500
LDI r8, 21
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
