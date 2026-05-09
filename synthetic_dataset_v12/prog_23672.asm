; DESCRIPTION: Composite: Renders a black disk with center (116, 83) and radius 57 then Places a orange dot at position (511, 229) then Places a magenta line segment connecting (182, 222) to (154, 241).
; PLAN: r0=116(x), r1=83(y), r2=57(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=511(x), r6=229(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=182(x1), r11=222(y1), r12=154(x2), r13=241(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 116
LDI r1, 83
LDI r2, 57
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 511
LDI r6, 229
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 182
LDI r11, 222
LDI r12, 154
LDI r13, 241
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
