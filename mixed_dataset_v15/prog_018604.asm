; DESCRIPTION: Composite: Sets a single blue pixel at (299, 249) then Creates a magenta circular shape at (168, 143) with radius 65 then Renders a red line between points (127, 65) and (484, 137).
; PLAN: r0=299(x), r1=249(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=168(x), r6=143(y), r7=65(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=127(x1), r11=65(y1), r12=484(x2), r13=137(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 299
LDI r1, 249
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 168
LDI r6, 143
LDI r7, 65
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 127
LDI r11, 65
LDI r12, 484
LDI r13, 137
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
