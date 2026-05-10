; DESCRIPTION: Composite: Draws a black line from (435, 167) to (110, 216) then Sets a single purple pixel at (50, 29).
; PLAN: r0=435(x1), r1=167(y1), r2=110(x2), r3=216(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=50(x), r6=29(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 435
LDI r1, 167
LDI r2, 110
LDI r3, 216
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 50
LDI r6, 29
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
