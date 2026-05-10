; DESCRIPTION: Composite: Places a magenta line segment connecting (118, 59) to (30, 174) then Places a green circle of radius 38 at center (428, 40).
; PLAN: r0=118(x1), r1=59(y1), r2=30(x2), r3=174(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=428(x), r6=40(y), r7=38(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 118
LDI r1, 59
LDI r2, 30
LDI r3, 174
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 428
LDI r6, 40
LDI r7, 38
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
