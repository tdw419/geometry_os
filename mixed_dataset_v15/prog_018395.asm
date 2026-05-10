; DESCRIPTION: Composite: Renders a purple disk with center (58, 91) and radius 40 then Draws a red line from (495, 82) to (428, 209).
; PLAN: r0=58(x), r1=91(y), r2=40(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=495(x1), r6=82(y1), r7=428(x2), r8=209(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 58
LDI r1, 91
LDI r2, 40
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 495
LDI r6, 82
LDI r7, 428
LDI r8, 209
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
