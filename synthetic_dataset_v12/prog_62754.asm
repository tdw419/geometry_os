; DESCRIPTION: Composite: Renders a red line between points (11, 115) and (315, 178) then Draws a green circle centered at (101, 109) with radius 75 then Places a cyan dot at position (497, 171).
; PLAN: r0=11(x1), r1=115(y1), r2=315(x2), r3=178(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=101(x), r6=109(y), r7=75(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=497(x), r11=171(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 11
LDI r1, 115
LDI r2, 315
LDI r3, 178
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 101
LDI r6, 109
LDI r7, 75
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 497
LDI r11, 171
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
