; DESCRIPTION: Composite: Sets a single red pixel at (55, 166) then Creates a purple circular shape at (386, 31) with radius 27 then Renders a black line between points (161, 22) and (168, 220).
; PLAN: r0=55(x), r1=166(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=386(x), r6=31(y), r7=27(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=161(x1), r11=22(y1), r12=168(x2), r13=220(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 55
LDI r1, 166
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 386
LDI r6, 31
LDI r7, 27
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 161
LDI r11, 22
LDI r12, 168
LDI r13, 220
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
