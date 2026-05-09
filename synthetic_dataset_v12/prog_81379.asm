; DESCRIPTION: Composite: Renders a magenta line between points (105, 101) and (139, 225) then Renders a red disk with center (404, 177) and radius 59 then Sets a single magenta pixel at (284, 105).
; PLAN: r0=105(x1), r1=101(y1), r2=139(x2), r3=225(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=404(x), r6=177(y), r7=59(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=284(x), r11=105(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 105
LDI r1, 101
LDI r2, 139
LDI r3, 225
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 404
LDI r6, 177
LDI r7, 59
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 284
LDI r11, 105
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
