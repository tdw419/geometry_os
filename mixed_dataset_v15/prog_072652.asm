; DESCRIPTION: Composite: Renders a blue line between points (459, 225) and (429, 171) then Draws a blue circle centered at (382, 174) with radius 42.
; PLAN: r0=459(x1), r1=225(y1), r2=429(x2), r3=171(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=382(x), r6=174(y), r7=42(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 459
LDI r1, 225
LDI r2, 429
LDI r3, 171
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 382
LDI r6, 174
LDI r7, 42
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
