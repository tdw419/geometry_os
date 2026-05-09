; DESCRIPTION: Composite: Renders a cyan line between points (146, 110) and (334, 38) then Draws a orange circle centered at (140, 200) with radius 56.
; PLAN: r0=146(x1), r1=110(y1), r2=334(x2), r3=38(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=140(x), r6=200(y), r7=56(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 146
LDI r1, 110
LDI r2, 334
LDI r3, 38
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 140
LDI r6, 200
LDI r7, 56
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
