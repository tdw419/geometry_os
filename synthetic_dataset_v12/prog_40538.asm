; DESCRIPTION: Composite: Sets a single green pixel at (45, 70) then Renders a purple line between points (280, 136) and (465, 252).
; PLAN: r0=45(x), r1=70(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=280(x1), r6=136(y1), r7=465(x2), r8=252(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 45
LDI r1, 70
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 280
LDI r6, 136
LDI r7, 465
LDI r8, 252
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
