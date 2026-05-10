; DESCRIPTION: Composite: Renders a white line between points (377, 151) and (95, 47) then Creates a white rectangular region at (96, 169) spanning 89 by 55 pixels then Places a black dot at position (184, 252).
; PLAN: r0=377(x1), r1=151(y1), r2=95(x2), r3=47(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=96(x), r6=169(y), r7=89(width), r8=55(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=184(x), r11=252(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 377
LDI r1, 151
LDI r2, 95
LDI r3, 47
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 96
LDI r6, 169
LDI r7, 89
LDI r8, 55
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 184
LDI r11, 252
LDI r12, 0x000000
PSET r10, r11, r12
HALT
