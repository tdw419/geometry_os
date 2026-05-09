; DESCRIPTION: Composite: Draws a red circle centered at (276, 135) with radius 80 then Places a magenta dot at position (162, 4) then Draws a red line from (413, 24) to (176, 33).
; PLAN: r0=276(x), r1=135(y), r2=80(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=162(x), r6=4(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=413(x1), r11=24(y1), r12=176(x2), r13=33(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 276
LDI r1, 135
LDI r2, 80
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 162
LDI r6, 4
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 413
LDI r11, 24
LDI r12, 176
LDI r13, 33
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
