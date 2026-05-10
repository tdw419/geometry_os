; DESCRIPTION: Composite: Sets a single red pixel at (475, 9) then Renders a green line between points (395, 40) and (357, 209).
; PLAN: r0=475(x), r1=9(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=395(x1), r6=40(y1), r7=357(x2), r8=209(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 475
LDI r1, 9
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 395
LDI r6, 40
LDI r7, 357
LDI r8, 209
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
