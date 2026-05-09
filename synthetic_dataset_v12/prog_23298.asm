; DESCRIPTION: Composite: Places a black dot at position (293, 220) then Creates a magenta circular shape at (432, 115) with radius 51 then Places a yellow line segment connecting (240, 36) to (363, 113).
; PLAN: r0=293(x), r1=220(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=432(x), r6=115(y), r7=51(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=240(x1), r11=36(y1), r12=363(x2), r13=113(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 293
LDI r1, 220
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 432
LDI r6, 115
LDI r7, 51
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 240
LDI r11, 36
LDI r12, 363
LDI r13, 113
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
