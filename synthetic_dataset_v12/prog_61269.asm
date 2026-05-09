; DESCRIPTION: Composite: Places a magenta line segment connecting (47, 115) to (180, 35) then Places a orange circle of radius 36 at center (428, 144).
; PLAN: r0=47(x1), r1=115(y1), r2=180(x2), r3=35(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=428(x), r6=144(y), r7=36(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 47
LDI r1, 115
LDI r2, 180
LDI r3, 35
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 428
LDI r6, 144
LDI r7, 36
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
