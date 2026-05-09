; DESCRIPTION: Composite: Draws a magenta line from (342, 83) to (313, 87) then Places a orange circle of radius 43 at center (115, 165).
; PLAN: r0=342(x1), r1=83(y1), r2=313(x2), r3=87(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=115(x), r6=165(y), r7=43(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 342
LDI r1, 83
LDI r2, 313
LDI r3, 87
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 115
LDI r6, 165
LDI r7, 43
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
