; DESCRIPTION: Composite: Places a yellow circle of radius 61 at center (400, 142) then Draws a magenta line from (334, 216) to (51, 240).
; PLAN: r0=400(x), r1=142(y), r2=61(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=334(x1), r6=216(y1), r7=51(x2), r8=240(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 400
LDI r1, 142
LDI r2, 61
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 334
LDI r6, 216
LDI r7, 51
LDI r8, 240
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
