; DESCRIPTION: Composite: Renders a blue disk with center (127, 104) and radius 55 then Draws a red line from (92, 167) to (27, 43).
; PLAN: r0=127(x), r1=104(y), r2=55(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=92(x1), r6=167(y1), r7=27(x2), r8=43(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 127
LDI r1, 104
LDI r2, 55
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 92
LDI r6, 167
LDI r7, 27
LDI r8, 43
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
