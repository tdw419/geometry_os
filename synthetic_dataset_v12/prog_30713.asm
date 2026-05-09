; DESCRIPTION: Composite: Sets a single magenta pixel at (304, 242) then Creates a purple circular shape at (201, 135) with radius 75 then Renders a black line between points (68, 42) and (303, 176).
; PLAN: r0=304(x), r1=242(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=201(x), r6=135(y), r7=75(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=68(x1), r11=42(y1), r12=303(x2), r13=176(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 304
LDI r1, 242
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 201
LDI r6, 135
LDI r7, 75
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 68
LDI r11, 42
LDI r12, 303
LDI r13, 176
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
