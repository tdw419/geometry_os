; DESCRIPTION: Composite: Renders a yellow line between points (466, 93) and (250, 83) then Creates a blue rectangular region at (340, 49) spanning 35 by 111 pixels.
; PLAN: r0=466(x1), r1=93(y1), r2=250(x2), r3=83(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=340(x), r6=49(y), r7=35(width), r8=111(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 466
LDI r1, 93
LDI r2, 250
LDI r3, 83
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 340
LDI r6, 49
LDI r7, 35
LDI r8, 111
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
