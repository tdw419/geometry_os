; DESCRIPTION: Composite: Places a magenta dot at position (368, 64) then Places a orange circle of radius 34 at center (194, 80) then Renders a white line between points (338, 190) and (468, 132).
; PLAN: r0=368(x), r1=64(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=194(x), r6=80(y), r7=34(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=338(x1), r11=190(y1), r12=468(x2), r13=132(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 368
LDI r1, 64
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 194
LDI r6, 80
LDI r7, 34
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 338
LDI r11, 190
LDI r12, 468
LDI r13, 132
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
