; DESCRIPTION: Composite: Places a purple line segment connecting (493, 147) to (236, 95) then Places a yellow circle of radius 47 at center (464, 143).
; PLAN: r0=493(x1), r1=147(y1), r2=236(x2), r3=95(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=464(x), r6=143(y), r7=47(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 493
LDI r1, 147
LDI r2, 236
LDI r3, 95
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 464
LDI r6, 143
LDI r7, 47
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
