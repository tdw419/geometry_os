; DESCRIPTION: Composite: Renders a blue disk with center (309, 106) and radius 78 then Draws a purple line from (82, 29) to (487, 5).
; PLAN: r0=309(x), r1=106(y), r2=78(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=82(x1), r6=29(y1), r7=487(x2), r8=5(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 309
LDI r1, 106
LDI r2, 78
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 82
LDI r6, 29
LDI r7, 487
LDI r8, 5
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
