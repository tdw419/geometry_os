; DESCRIPTION: Composite: Renders a blue disk with center (251, 140) and radius 70 then Draws a orange line from (371, 202) to (306, 233).
; PLAN: r0=251(x), r1=140(y), r2=70(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=371(x1), r6=202(y1), r7=306(x2), r8=233(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 251
LDI r1, 140
LDI r2, 70
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 371
LDI r6, 202
LDI r7, 306
LDI r8, 233
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
