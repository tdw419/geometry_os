; DESCRIPTION: Composite: Places a red line segment connecting (412, 200) to (77, 23) then Draws a cyan circle centered at (120, 145) with radius 35.
; PLAN: r0=412(x1), r1=200(y1), r2=77(x2), r3=23(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=120(x), r6=145(y), r7=35(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 412
LDI r1, 200
LDI r2, 77
LDI r3, 23
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 120
LDI r6, 145
LDI r7, 35
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
