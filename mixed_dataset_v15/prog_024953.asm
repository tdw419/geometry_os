; DESCRIPTION: Composite: Renders a green line between points (249, 181) and (487, 37) then Places a green circle of radius 42 at center (305, 72) then Sets a single blue pixel at (333, 241).
; PLAN: r0=249(x1), r1=181(y1), r2=487(x2), r3=37(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=305(x), r6=72(y), r7=42(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=333(x), r11=241(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 249
LDI r1, 181
LDI r2, 487
LDI r3, 37
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 305
LDI r6, 72
LDI r7, 42
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 333
LDI r11, 241
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
