; DESCRIPTION: Composite: Places a magenta dot at position (154, 120) then Draws a red line from (480, 171) to (186, 105) then Creates a white circular shape at (438, 102) with radius 72.
; PLAN: r0=154(x), r1=120(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=480(x1), r6=171(y1), r7=186(x2), r8=105(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=438(x), r11=102(y), r12=72(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 154
LDI r1, 120
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 480
LDI r6, 171
LDI r7, 186
LDI r8, 105
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 438
LDI r11, 102
LDI r12, 72
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
