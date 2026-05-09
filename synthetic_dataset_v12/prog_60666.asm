; DESCRIPTION: Composite: Renders a orange line between points (101, 98) and (455, 212) then Sets a single purple pixel at (450, 152).
; PLAN: r0=101(x1), r1=98(y1), r2=455(x2), r3=212(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=450(x), r6=152(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 101
LDI r1, 98
LDI r2, 455
LDI r3, 212
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 450
LDI r6, 152
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
