; DESCRIPTION: Composite: Places a black dot at position (187, 9) then Draws a white line from (361, 35) to (100, 37) then Renders a green disk with center (259, 82) and radius 36.
; PLAN: r0=187(x), r1=9(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=361(x1), r6=35(y1), r7=100(x2), r8=37(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=259(x), r11=82(y), r12=36(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 187
LDI r1, 9
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 361
LDI r6, 35
LDI r7, 100
LDI r8, 37
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 259
LDI r11, 82
LDI r12, 36
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
