; DESCRIPTION: Composite: Renders a yellow disk with center (113, 172) and radius 38 then Draws a magenta line from (455, 160) to (295, 149) then Sets a single blue pixel at (289, 92).
; PLAN: r0=113(x), r1=172(y), r2=38(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=455(x1), r6=160(y1), r7=295(x2), r8=149(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=289(x), r11=92(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 113
LDI r1, 172
LDI r2, 38
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 455
LDI r6, 160
LDI r7, 295
LDI r8, 149
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 289
LDI r11, 92
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
