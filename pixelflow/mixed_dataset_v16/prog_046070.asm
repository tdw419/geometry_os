; DESCRIPTION: Composite: Sets a single white pixel at (321, 184) then Renders a magenta disk with center (153, 189) and radius 32 then Renders a cyan line between points (432, 202) and (417, 80).
; PLAN: r0=321(x), r1=184(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=153(x), r6=189(y), r7=32(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=432(x1), r11=202(y1), r12=417(x2), r13=80(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 321
LDI r1, 184
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 153
LDI r6, 189
LDI r7, 32
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 432
LDI r11, 202
LDI r12, 417
LDI r13, 80
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
