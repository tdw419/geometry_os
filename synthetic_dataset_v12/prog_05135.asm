; DESCRIPTION: Composite: Places a orange dot at position (417, 242) then Renders a cyan line between points (182, 21) and (319, 159) then Creates a red circular shape at (473, 149) with radius 30.
; PLAN: r0=417(x), r1=242(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=182(x1), r6=21(y1), r7=319(x2), r8=159(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=473(x), r11=149(y), r12=30(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 417
LDI r1, 242
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 182
LDI r6, 21
LDI r7, 319
LDI r8, 159
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 473
LDI r11, 149
LDI r12, 30
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
