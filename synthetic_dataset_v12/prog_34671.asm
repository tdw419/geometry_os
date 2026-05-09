; DESCRIPTION: Composite: Places a purple 85x118 rectangle at position (303, 113) then Renders a yellow line between points (13, 251) and (27, 237).
; PLAN: r0=303(x), r1=113(y), r2=85(width), r3=118(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=13(x1), r6=251(y1), r7=27(x2), r8=237(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 303
LDI r1, 113
LDI r2, 85
LDI r3, 118
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 13
LDI r6, 251
LDI r7, 27
LDI r8, 237
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
