; DESCRIPTION: Composite: Creates a yellow circular shape at (394, 148) with radius 67 then Sets a single yellow pixel at (330, 199) then Renders a magenta line between points (210, 145) and (104, 225).
; PLAN: r0=394(x), r1=148(y), r2=67(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=330(x), r6=199(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=210(x1), r11=145(y1), r12=104(x2), r13=225(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 394
LDI r1, 148
LDI r2, 67
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 330
LDI r6, 199
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 210
LDI r11, 145
LDI r12, 104
LDI r13, 225
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
