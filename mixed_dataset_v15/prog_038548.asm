; DESCRIPTION: Composite: Places a cyan dot at position (36, 145) then Places a white circle of radius 61 at center (69, 137) then Draws a yellow line from (420, 127) to (172, 202).
; PLAN: r0=36(x), r1=145(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=69(x), r6=137(y), r7=61(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=420(x1), r11=127(y1), r12=172(x2), r13=202(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 36
LDI r1, 145
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 69
LDI r6, 137
LDI r7, 61
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 420
LDI r11, 127
LDI r12, 172
LDI r13, 202
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
