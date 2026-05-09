; DESCRIPTION: Composite: Places a magenta line segment connecting (10, 3) to (446, 212) then Renders a red disk with center (174, 131) and radius 45 then Sets a single red pixel at (458, 65).
; PLAN: r0=10(x1), r1=3(y1), r2=446(x2), r3=212(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=174(x), r6=131(y), r7=45(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=458(x), r11=65(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 10
LDI r1, 3
LDI r2, 446
LDI r3, 212
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 174
LDI r6, 131
LDI r7, 45
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 458
LDI r11, 65
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
