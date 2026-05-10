; DESCRIPTION: Composite: Renders a magenta disk with center (296, 57) and radius 32 then Draws a magenta line from (474, 81) to (496, 144).
; PLAN: r0=296(x), r1=57(y), r2=32(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=474(x1), r6=81(y1), r7=496(x2), r8=144(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 296
LDI r1, 57
LDI r2, 32
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 474
LDI r6, 81
LDI r7, 496
LDI r8, 144
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
