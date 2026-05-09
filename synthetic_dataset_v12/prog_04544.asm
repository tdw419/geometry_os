; DESCRIPTION: Composite: Sets a single purple pixel at (148, 27) then Draws a red line from (367, 201) to (70, 51) then Draws a yellow circle centered at (362, 162) with radius 78.
; PLAN: r0=148(x), r1=27(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=367(x1), r6=201(y1), r7=70(x2), r8=51(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=362(x), r11=162(y), r12=78(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 148
LDI r1, 27
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 367
LDI r6, 201
LDI r7, 70
LDI r8, 51
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 362
LDI r11, 162
LDI r12, 78
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
