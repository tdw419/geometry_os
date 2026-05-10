; DESCRIPTION: Composite: Renders a black disk with center (406, 156) and radius 72 then Draws a red line from (477, 94) to (337, 251) then Places a magenta dot at position (92, 18).
; PLAN: r0=406(x), r1=156(y), r2=72(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=477(x1), r6=94(y1), r7=337(x2), r8=251(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=92(x), r11=18(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 406
LDI r1, 156
LDI r2, 72
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 477
LDI r6, 94
LDI r7, 337
LDI r8, 251
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 92
LDI r11, 18
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
