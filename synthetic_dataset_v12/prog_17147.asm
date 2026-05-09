; DESCRIPTION: Composite: Renders a purple line between points (460, 158) and (205, 255) then Creates a blue rectangular region at (435, 109) spanning 75 by 36 pixels.
; PLAN: r0=460(x1), r1=158(y1), r2=205(x2), r3=255(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=435(x), r6=109(y), r7=75(width), r8=36(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 460
LDI r1, 158
LDI r2, 205
LDI r3, 255
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 435
LDI r6, 109
LDI r7, 75
LDI r8, 36
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
