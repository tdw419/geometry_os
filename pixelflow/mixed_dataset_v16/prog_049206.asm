; DESCRIPTION: Composite: Sets a single green pixel at (240, 20) then Draws a red line from (396, 68) to (170, 253).
; PLAN: r0=240(x), r1=20(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=396(x1), r6=68(y1), r7=170(x2), r8=253(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 240
LDI r1, 20
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 396
LDI r6, 68
LDI r7, 170
LDI r8, 253
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
