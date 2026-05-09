; DESCRIPTION: Composite: Draws a red line from (15, 165) to (95, 29) then Places a white dot at position (175, 14).
; PLAN: r0=15(x1), r1=165(y1), r2=95(x2), r3=29(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=175(x), r6=14(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 15
LDI r1, 165
LDI r2, 95
LDI r3, 29
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 175
LDI r6, 14
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
