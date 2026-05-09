; DESCRIPTION: Composite: Places a purple dot at position (493, 59) then Renders a red line between points (319, 27) and (45, 200).
; PLAN: r0=493(x), r1=59(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=319(x1), r6=27(y1), r7=45(x2), r8=200(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 493
LDI r1, 59
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 319
LDI r6, 27
LDI r7, 45
LDI r8, 200
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
