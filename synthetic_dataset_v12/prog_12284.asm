; DESCRIPTION: Composite: Places a blue dot at position (494, 91) then Renders a red line between points (209, 190) and (500, 60).
; PLAN: r0=494(x), r1=91(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=209(x1), r6=190(y1), r7=500(x2), r8=60(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 494
LDI r1, 91
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 209
LDI r6, 190
LDI r7, 500
LDI r8, 60
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
