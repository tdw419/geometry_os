; DESCRIPTION: Composite: Places a red circle of radius 19 at center (298, 185) then Places a blue line segment connecting (219, 182) to (98, 87).
; PLAN: r0=298(x), r1=185(y), r2=19(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=219(x1), r6=182(y1), r7=98(x2), r8=87(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 298
LDI r1, 185
LDI r2, 19
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 219
LDI r6, 182
LDI r7, 98
LDI r8, 87
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
