; DESCRIPTION: Composite: Sets a single purple pixel at (200, 13) then Renders a black disk with center (152, 93) and radius 75 then Draws a white line from (73, 166) to (119, 144).
; PLAN: r0=200(x), r1=13(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=152(x), r6=93(y), r7=75(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=73(x1), r11=166(y1), r12=119(x2), r13=144(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 200
LDI r1, 13
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 152
LDI r6, 93
LDI r7, 75
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 73
LDI r11, 166
LDI r12, 119
LDI r13, 144
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
