; DESCRIPTION: Composite: Sets a single magenta pixel at (247, 37) then Places a blue circle of radius 71 at center (218, 105) then Renders a red line between points (363, 117) and (107, 154).
; PLAN: r0=247(x), r1=37(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=218(x), r6=105(y), r7=71(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=363(x1), r11=117(y1), r12=107(x2), r13=154(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 247
LDI r1, 37
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 218
LDI r6, 105
LDI r7, 71
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 363
LDI r11, 117
LDI r12, 107
LDI r13, 154
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
