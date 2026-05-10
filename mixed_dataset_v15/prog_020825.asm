; DESCRIPTION: Composite: Places a magenta circle of radius 38 at center (389, 186) then Draws a magenta line from (313, 48) to (508, 129).
; PLAN: r0=389(x), r1=186(y), r2=38(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=313(x1), r6=48(y1), r7=508(x2), r8=129(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 389
LDI r1, 186
LDI r2, 38
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 313
LDI r6, 48
LDI r7, 508
LDI r8, 129
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
