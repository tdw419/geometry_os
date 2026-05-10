; DESCRIPTION: Composite: Draws a red line from (68, 123) to (80, 236) then Places a red circle of radius 25 at center (275, 36).
; PLAN: r0=68(x1), r1=123(y1), r2=80(x2), r3=236(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=275(x), r6=36(y), r7=25(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 68
LDI r1, 123
LDI r2, 80
LDI r3, 236
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 275
LDI r6, 36
LDI r7, 25
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
