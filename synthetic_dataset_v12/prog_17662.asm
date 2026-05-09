; DESCRIPTION: Composite: Renders a yellow box of size 94x87 starting at (285, 122) then Places a purple line segment connecting (29, 240) to (369, 82).
; PLAN: r0=285(x), r1=122(y), r2=94(width), r3=87(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=29(x1), r6=240(y1), r7=369(x2), r8=82(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 285
LDI r1, 122
LDI r2, 94
LDI r3, 87
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 29
LDI r6, 240
LDI r7, 369
LDI r8, 82
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
