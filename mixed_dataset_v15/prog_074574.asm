; DESCRIPTION: Composite: Renders a purple line between points (264, 24) and (196, 230) then Places a white circle of radius 76 at center (330, 81).
; PLAN: r0=264(x1), r1=24(y1), r2=196(x2), r3=230(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=330(x), r6=81(y), r7=76(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 264
LDI r1, 24
LDI r2, 196
LDI r3, 230
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 330
LDI r6, 81
LDI r7, 76
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
