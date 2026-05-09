; DESCRIPTION: Composite: Places a red dot at position (274, 1) then Creates a orange circular shape at (447, 133) with radius 57 then Renders a magenta line between points (295, 115) and (86, 13).
; PLAN: r0=274(x), r1=1(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=447(x), r6=133(y), r7=57(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=295(x1), r11=115(y1), r12=86(x2), r13=13(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 274
LDI r1, 1
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 447
LDI r6, 133
LDI r7, 57
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 295
LDI r11, 115
LDI r12, 86
LDI r13, 13
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
