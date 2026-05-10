; DESCRIPTION: Composite: Places a magenta dot at position (511, 95) then Creates a magenta circular shape at (247, 127) with radius 70 then Renders a white line between points (388, 155) and (213, 186).
; PLAN: r0=511(x), r1=95(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=247(x), r6=127(y), r7=70(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=388(x1), r11=155(y1), r12=213(x2), r13=186(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 511
LDI r1, 95
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 247
LDI r6, 127
LDI r7, 70
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 388
LDI r11, 155
LDI r12, 213
LDI r13, 186
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
