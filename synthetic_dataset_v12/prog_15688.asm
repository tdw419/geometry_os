; DESCRIPTION: Composite: Places a red dot at position (173, 205) then Renders a yellow disk with center (459, 193) and radius 50 then Renders a black line between points (182, 179) and (396, 152).
; PLAN: r0=173(x), r1=205(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=459(x), r6=193(y), r7=50(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=182(x1), r11=179(y1), r12=396(x2), r13=152(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 173
LDI r1, 205
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 459
LDI r6, 193
LDI r7, 50
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 182
LDI r11, 179
LDI r12, 396
LDI r13, 152
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
