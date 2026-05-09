; DESCRIPTION: Composite: Sets a single purple pixel at (494, 215) then Creates a yellow circular shape at (236, 65) with radius 33 then Renders a green line between points (108, 255) and (342, 141).
; PLAN: r0=494(x), r1=215(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=236(x), r6=65(y), r7=33(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=108(x1), r11=255(y1), r12=342(x2), r13=141(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 494
LDI r1, 215
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 236
LDI r6, 65
LDI r7, 33
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 108
LDI r11, 255
LDI r12, 342
LDI r13, 141
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
