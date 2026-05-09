; DESCRIPTION: Composite: Creates a blue rectangular region at (354, 87) spanning 66 by 74 pixels then Renders a purple line between points (440, 58) and (202, 216).
; PLAN: r0=354(x), r1=87(y), r2=66(width), r3=74(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=440(x1), r6=58(y1), r7=202(x2), r8=216(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 354
LDI r1, 87
LDI r2, 66
LDI r3, 74
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 440
LDI r6, 58
LDI r7, 202
LDI r8, 216
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
