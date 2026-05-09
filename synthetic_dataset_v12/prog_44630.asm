; DESCRIPTION: Composite: Renders a cyan line between points (241, 230) and (213, 250) then Draws a purple circle centered at (216, 69) with radius 49.
; PLAN: r0=241(x1), r1=230(y1), r2=213(x2), r3=250(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=216(x), r6=69(y), r7=49(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 241
LDI r1, 230
LDI r2, 213
LDI r3, 250
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 216
LDI r6, 69
LDI r7, 49
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
