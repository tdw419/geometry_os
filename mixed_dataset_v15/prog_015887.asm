; DESCRIPTION: Composite: Draws a blue line from (9, 233) to (450, 56) then Renders a blue disk with center (227, 74) and radius 35.
; PLAN: r0=9(x1), r1=233(y1), r2=450(x2), r3=56(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=227(x), r6=74(y), r7=35(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 9
LDI r1, 233
LDI r2, 450
LDI r3, 56
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 227
LDI r6, 74
LDI r7, 35
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
