; DESCRIPTION: Composite: Renders a blue line between points (296, 10) and (285, 213) then Renders a green disk with center (367, 171) and radius 75.
; PLAN: r0=296(x1), r1=10(y1), r2=285(x2), r3=213(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=367(x), r6=171(y), r7=75(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 296
LDI r1, 10
LDI r2, 285
LDI r3, 213
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 367
LDI r6, 171
LDI r7, 75
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
