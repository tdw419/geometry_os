; DESCRIPTION: Composite: Renders a blue disk with center (236, 92) and radius 16 then Draws a red line from (385, 98) to (432, 124).
; PLAN: r0=236(x), r1=92(y), r2=16(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=385(x1), r6=98(y1), r7=432(x2), r8=124(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 236
LDI r1, 92
LDI r2, 16
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 385
LDI r6, 98
LDI r7, 432
LDI r8, 124
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
