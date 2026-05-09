; DESCRIPTION: Composite: Renders a red line between points (497, 5) and (153, 221) then Places a orange circle of radius 68 at center (275, 90).
; PLAN: r0=497(x1), r1=5(y1), r2=153(x2), r3=221(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=275(x), r6=90(y), r7=68(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 497
LDI r1, 5
LDI r2, 153
LDI r3, 221
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 275
LDI r6, 90
LDI r7, 68
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
