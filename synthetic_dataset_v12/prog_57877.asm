; DESCRIPTION: Composite: Draws a red line from (292, 172) to (349, 250) then Creates a red rectangular region at (333, 153) spanning 100 by 85 pixels then Places a white dot at position (503, 124).
; PLAN: r0=292(x1), r1=172(y1), r2=349(x2), r3=250(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=333(x), r6=153(y), r7=100(width), r8=85(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=503(x), r11=124(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 292
LDI r1, 172
LDI r2, 349
LDI r3, 250
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 333
LDI r6, 153
LDI r7, 100
LDI r8, 85
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 503
LDI r11, 124
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
