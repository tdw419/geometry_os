; DESCRIPTION: Composite: Places a red dot at position (193, 252) then Renders a yellow disk with center (289, 161) and radius 45 then Places a green line segment connecting (92, 199) to (229, 35).
; PLAN: r0=193(x), r1=252(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=289(x), r6=161(y), r7=45(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=92(x1), r11=199(y1), r12=229(x2), r13=35(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 193
LDI r1, 252
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 289
LDI r6, 161
LDI r7, 45
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 92
LDI r11, 199
LDI r12, 229
LDI r13, 35
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
