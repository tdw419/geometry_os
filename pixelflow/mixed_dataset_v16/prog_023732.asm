; DESCRIPTION: Composite: Draws a purple line from (355, 84) to (216, 86) then Sets a single cyan pixel at (395, 93).
; PLAN: r0=355(x1), r1=84(y1), r2=216(x2), r3=86(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=395(x), r6=93(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 355
LDI r1, 84
LDI r2, 216
LDI r3, 86
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 395
LDI r6, 93
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
