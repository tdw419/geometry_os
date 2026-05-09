; DESCRIPTION: Composite: Renders a yellow disk with center (58, 171) and radius 49 then Draws a blue line from (307, 229) to (186, 23) then Sets a single blue pixel at (178, 38).
; PLAN: r0=58(x), r1=171(y), r2=49(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=307(x1), r6=229(y1), r7=186(x2), r8=23(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=178(x), r11=38(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 58
LDI r1, 171
LDI r2, 49
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 307
LDI r6, 229
LDI r7, 186
LDI r8, 23
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 178
LDI r11, 38
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
