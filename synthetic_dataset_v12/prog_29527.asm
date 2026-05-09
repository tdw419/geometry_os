; DESCRIPTION: Composite: Places a red line segment connecting (410, 20) to (45, 65) then Places a yellow dot at position (266, 157).
; PLAN: r0=410(x1), r1=20(y1), r2=45(x2), r3=65(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=266(x), r6=157(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 410
LDI r1, 20
LDI r2, 45
LDI r3, 65
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 266
LDI r6, 157
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
