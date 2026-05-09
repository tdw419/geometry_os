; DESCRIPTION: Composite: Places a red line segment connecting (334, 61) to (123, 110) then Places a purple circle of radius 75 at center (290, 86).
; PLAN: r0=334(x1), r1=61(y1), r2=123(x2), r3=110(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=290(x), r6=86(y), r7=75(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 334
LDI r1, 61
LDI r2, 123
LDI r3, 110
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 290
LDI r6, 86
LDI r7, 75
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
