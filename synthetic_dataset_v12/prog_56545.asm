; DESCRIPTION: Composite: Sets a single purple pixel at (282, 186) then Renders a yellow disk with center (118, 64) and radius 39 then Draws a magenta line from (459, 58) to (54, 141).
; PLAN: r0=282(x), r1=186(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=118(x), r6=64(y), r7=39(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=459(x1), r11=58(y1), r12=54(x2), r13=141(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 282
LDI r1, 186
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 118
LDI r6, 64
LDI r7, 39
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 459
LDI r11, 58
LDI r12, 54
LDI r13, 141
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
