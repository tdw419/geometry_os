; DESCRIPTION: Composite: Sets a single red pixel at (242, 81) then Creates a orange circular shape at (444, 177) with radius 42 then Renders a white line between points (99, 216) and (338, 81).
; PLAN: r0=242(x), r1=81(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=444(x), r6=177(y), r7=42(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=99(x1), r11=216(y1), r12=338(x2), r13=81(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 242
LDI r1, 81
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 444
LDI r6, 177
LDI r7, 42
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 99
LDI r11, 216
LDI r12, 338
LDI r13, 81
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
