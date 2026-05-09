; DESCRIPTION: Composite: Draws a white line from (489, 23) to (303, 79) then Places a red circle of radius 35 at center (112, 209).
; PLAN: r0=489(x1), r1=23(y1), r2=303(x2), r3=79(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=112(x), r6=209(y), r7=35(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 489
LDI r1, 23
LDI r2, 303
LDI r3, 79
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 112
LDI r6, 209
LDI r7, 35
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
