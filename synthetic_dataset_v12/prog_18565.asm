; DESCRIPTION: Composite: Draws a white line from (162, 81) to (210, 136) then Draws a red circle centered at (452, 179) with radius 47 then Sets a single blue pixel at (446, 236).
; PLAN: r0=162(x1), r1=81(y1), r2=210(x2), r3=136(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=452(x), r6=179(y), r7=47(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=446(x), r11=236(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 162
LDI r1, 81
LDI r2, 210
LDI r3, 136
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 452
LDI r6, 179
LDI r7, 47
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 446
LDI r11, 236
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
