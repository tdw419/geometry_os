; DESCRIPTION: Composite: Places a green dot at position (310, 216) then Renders a purple line between points (396, 55) and (227, 175).
; PLAN: r0=310(x), r1=216(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=396(x1), r6=55(y1), r7=227(x2), r8=175(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 310
LDI r1, 216
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 396
LDI r6, 55
LDI r7, 227
LDI r8, 175
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
