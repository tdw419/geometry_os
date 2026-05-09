; DESCRIPTION: Composite: Places a black dot at position (368, 44) then Renders a purple line between points (279, 242) and (430, 81) then Places a purple circle of radius 61 at center (130, 161).
; PLAN: r0=368(x), r1=44(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=279(x1), r6=242(y1), r7=430(x2), r8=81(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=130(x), r11=161(y), r12=61(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 368
LDI r1, 44
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 279
LDI r6, 242
LDI r7, 430
LDI r8, 81
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 130
LDI r11, 161
LDI r12, 61
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
