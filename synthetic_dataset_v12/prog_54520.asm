; DESCRIPTION: Composite: Places a red 94x25 rectangle at position (81, 7) then Renders a purple line between points (369, 111) and (201, 110).
; PLAN: r0=81(x), r1=7(y), r2=94(width), r3=25(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=369(x1), r6=111(y1), r7=201(x2), r8=110(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 81
LDI r1, 7
LDI r2, 94
LDI r3, 25
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 369
LDI r6, 111
LDI r7, 201
LDI r8, 110
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
