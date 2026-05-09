; DESCRIPTION: Composite: Sets a single magenta pixel at (367, 227) then Creates a black circular shape at (274, 70) with radius 42 then Renders a green line between points (280, 127) and (71, 111).
; PLAN: r0=367(x), r1=227(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=274(x), r6=70(y), r7=42(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=280(x1), r11=127(y1), r12=71(x2), r13=111(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 367
LDI r1, 227
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 274
LDI r6, 70
LDI r7, 42
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 280
LDI r11, 127
LDI r12, 71
LDI r13, 111
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
