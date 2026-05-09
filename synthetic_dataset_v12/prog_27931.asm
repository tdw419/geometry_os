; DESCRIPTION: Composite: Renders a magenta line between points (296, 238) and (498, 174) then Renders a white disk with center (280, 106) and radius 27.
; PLAN: r0=296(x1), r1=238(y1), r2=498(x2), r3=174(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=280(x), r6=106(y), r7=27(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 296
LDI r1, 238
LDI r2, 498
LDI r3, 174
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 280
LDI r6, 106
LDI r7, 27
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
