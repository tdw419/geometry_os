; DESCRIPTION: Composite: Draws a yellow line from (52, 47) to (298, 78) then Sets a single purple pixel at (431, 223).
; PLAN: r0=52(x1), r1=47(y1), r2=298(x2), r3=78(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=431(x), r6=223(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 52
LDI r1, 47
LDI r2, 298
LDI r3, 78
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 431
LDI r6, 223
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
