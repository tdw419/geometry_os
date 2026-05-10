; DESCRIPTION: Composite: Draws a green circle centered at (443, 82) with radius 41 then Renders a blue line between points (208, 93) and (506, 67) then Sets a single red pixel at (368, 88).
; PLAN: r0=443(x), r1=82(y), r2=41(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=208(x1), r6=93(y1), r7=506(x2), r8=67(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=368(x), r11=88(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 443
LDI r1, 82
LDI r2, 41
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 208
LDI r6, 93
LDI r7, 506
LDI r8, 67
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 368
LDI r11, 88
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
