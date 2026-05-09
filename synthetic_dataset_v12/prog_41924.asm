; DESCRIPTION: Composite: Places a purple circle of radius 46 at center (453, 122) then Renders a purple line between points (456, 146) and (345, 80).
; PLAN: r0=453(x), r1=122(y), r2=46(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=456(x1), r6=146(y1), r7=345(x2), r8=80(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 453
LDI r1, 122
LDI r2, 46
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 456
LDI r6, 146
LDI r7, 345
LDI r8, 80
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
