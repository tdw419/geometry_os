; DESCRIPTION: Composite: Renders a black disk with center (151, 179) and radius 20 then Draws a red line from (416, 5) to (180, 223).
; PLAN: r0=151(x), r1=179(y), r2=20(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=416(x1), r6=5(y1), r7=180(x2), r8=223(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 151
LDI r1, 179
LDI r2, 20
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 416
LDI r6, 5
LDI r7, 180
LDI r8, 223
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
