; DESCRIPTION: Composite: Places a black dot at position (302, 22) then Places a green circle of radius 77 at center (383, 154) then Places a red line segment connecting (425, 234) to (221, 87).
; PLAN: r0=302(x), r1=22(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=383(x), r6=154(y), r7=77(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=425(x1), r11=234(y1), r12=221(x2), r13=87(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 302
LDI r1, 22
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 383
LDI r6, 154
LDI r7, 77
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 425
LDI r11, 234
LDI r12, 221
LDI r13, 87
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
