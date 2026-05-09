; DESCRIPTION: Composite: Renders a green line between points (486, 252) and (315, 149) then Places a red dot at position (71, 107) then Creates a magenta circular shape at (279, 168) with radius 11.
; PLAN: r0=486(x1), r1=252(y1), r2=315(x2), r3=149(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=71(x), r6=107(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=279(x), r11=168(y), r12=11(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 486
LDI r1, 252
LDI r2, 315
LDI r3, 149
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 71
LDI r6, 107
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 279
LDI r11, 168
LDI r12, 11
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
