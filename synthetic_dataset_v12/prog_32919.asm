; DESCRIPTION: Composite: Renders a orange line between points (313, 212) and (510, 177) then Sets a single white pixel at (380, 185) then Places a magenta circle of radius 76 at center (115, 171).
; PLAN: r0=313(x1), r1=212(y1), r2=510(x2), r3=177(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=380(x), r6=185(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=115(x), r11=171(y), r12=76(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 313
LDI r1, 212
LDI r2, 510
LDI r3, 177
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 380
LDI r6, 185
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 115
LDI r11, 171
LDI r12, 76
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
