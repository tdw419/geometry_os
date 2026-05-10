; DESCRIPTION: Composite: Sets a single cyan pixel at (203, 57) then Renders a blue line between points (196, 200) and (24, 12).
; PLAN: r0=203(x), r1=57(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=196(x1), r6=200(y1), r7=24(x2), r8=12(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 203
LDI r1, 57
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 196
LDI r6, 200
LDI r7, 24
LDI r8, 12
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
