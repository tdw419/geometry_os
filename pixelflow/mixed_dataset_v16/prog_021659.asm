; DESCRIPTION: Composite: Draws a orange line from (288, 233) to (193, 177) then Renders a yellow disk with center (109, 186) and radius 47.
; PLAN: r0=288(x1), r1=233(y1), r2=193(x2), r3=177(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=109(x), r6=186(y), r7=47(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 288
LDI r1, 233
LDI r2, 193
LDI r3, 177
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 109
LDI r6, 186
LDI r7, 47
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
