; DESCRIPTION: Composite: Renders a orange disk with center (79, 146) and radius 78 then Draws a red line from (377, 153) to (344, 30) then Sets a single orange pixel at (450, 240).
; PLAN: r0=79(x), r1=146(y), r2=78(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=377(x1), r6=153(y1), r7=344(x2), r8=30(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=450(x), r11=240(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 79
LDI r1, 146
LDI r2, 78
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 377
LDI r6, 153
LDI r7, 344
LDI r8, 30
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 450
LDI r11, 240
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
