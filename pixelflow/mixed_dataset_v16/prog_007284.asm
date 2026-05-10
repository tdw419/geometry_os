; DESCRIPTION: Composite: Renders a magenta line between points (169, 75) and (493, 123) then Places a cyan dot at position (65, 18).
; PLAN: r0=169(x1), r1=75(y1), r2=493(x2), r3=123(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=65(x), r6=18(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 169
LDI r1, 75
LDI r2, 493
LDI r3, 123
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 65
LDI r6, 18
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
