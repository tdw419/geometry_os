; DESCRIPTION: Composite: Draws a blue line from (129, 202) to (505, 120) then Draws a orange circle centered at (254, 87) with radius 47.
; PLAN: r0=129(x1), r1=202(y1), r2=505(x2), r3=120(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=254(x), r6=87(y), r7=47(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 129
LDI r1, 202
LDI r2, 505
LDI r3, 120
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 254
LDI r6, 87
LDI r7, 47
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
