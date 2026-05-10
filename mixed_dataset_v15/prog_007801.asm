; DESCRIPTION: Composite: Sets a single black pixel at (302, 75) then Renders a magenta line between points (198, 7) and (309, 136) then Places a cyan circle of radius 12 at center (121, 171).
; PLAN: r0=302(x), r1=75(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=198(x1), r6=7(y1), r7=309(x2), r8=136(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=121(x), r11=171(y), r12=12(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 302
LDI r1, 75
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 198
LDI r6, 7
LDI r7, 309
LDI r8, 136
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 121
LDI r11, 171
LDI r12, 12
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
