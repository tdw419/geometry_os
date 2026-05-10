; DESCRIPTION: Composite: Renders a blue line between points (270, 247) and (251, 48) then Renders a purple box of size 119x47 starting at (339, 77).
; PLAN: r0=270(x1), r1=247(y1), r2=251(x2), r3=48(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=339(x), r6=77(y), r7=119(width), r8=47(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 270
LDI r1, 247
LDI r2, 251
LDI r3, 48
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 339
LDI r6, 77
LDI r7, 119
LDI r8, 47
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
