; DESCRIPTION: Composite: Renders a cyan disk with center (378, 182) and radius 43 then Draws a red line from (153, 133) to (20, 121).
; PLAN: r0=378(x), r1=182(y), r2=43(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=153(x1), r6=133(y1), r7=20(x2), r8=121(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 378
LDI r1, 182
LDI r2, 43
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 153
LDI r6, 133
LDI r7, 20
LDI r8, 121
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
