; DESCRIPTION: Composite: Places a red dot at position (102, 200) then Places a orange circle of radius 49 at center (279, 140) then Draws a yellow line from (259, 39) to (455, 229).
; PLAN: r0=102(x), r1=200(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=279(x), r6=140(y), r7=49(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=259(x1), r11=39(y1), r12=455(x2), r13=229(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 102
LDI r1, 200
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 279
LDI r6, 140
LDI r7, 49
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 259
LDI r11, 39
LDI r12, 455
LDI r13, 229
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
