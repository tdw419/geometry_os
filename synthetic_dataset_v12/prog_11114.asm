; DESCRIPTION: Composite: Places a white circle of radius 57 at center (121, 157) then Sets a single yellow pixel at (162, 11) then Renders a cyan line between points (192, 177) and (312, 113).
; PLAN: r0=121(x), r1=157(y), r2=57(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=162(x), r6=11(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=192(x1), r11=177(y1), r12=312(x2), r13=113(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 121
LDI r1, 157
LDI r2, 57
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 162
LDI r6, 11
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 192
LDI r11, 177
LDI r12, 312
LDI r13, 113
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
