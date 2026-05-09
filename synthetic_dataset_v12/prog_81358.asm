; DESCRIPTION: Composite: Creates a red circular shape at (251, 129) with radius 79 then Draws a blue line from (62, 6) to (317, 194).
; PLAN: r0=251(x), r1=129(y), r2=79(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=62(x1), r6=6(y1), r7=317(x2), r8=194(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 251
LDI r1, 129
LDI r2, 79
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 62
LDI r6, 6
LDI r7, 317
LDI r8, 194
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
