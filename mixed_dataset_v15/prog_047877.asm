; DESCRIPTION: Composite: Sets a single magenta pixel at (158, 177) then Creates a magenta circular shape at (53, 196) with radius 31 then Renders a cyan line between points (469, 73) and (510, 65).
; PLAN: r0=158(x), r1=177(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=53(x), r6=196(y), r7=31(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=469(x1), r11=73(y1), r12=510(x2), r13=65(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 158
LDI r1, 177
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 53
LDI r6, 196
LDI r7, 31
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 469
LDI r11, 73
LDI r12, 510
LDI r13, 65
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
