; DESCRIPTION: Composite: Draws a blue line from (22, 108) to (271, 208) then Creates a cyan circular shape at (330, 142) with radius 55 then Sets a single blue pixel at (126, 145).
; PLAN: r0=22(x1), r1=108(y1), r2=271(x2), r3=208(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=330(x), r6=142(y), r7=55(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=126(x), r11=145(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 22
LDI r1, 108
LDI r2, 271
LDI r3, 208
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 330
LDI r6, 142
LDI r7, 55
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 126
LDI r11, 145
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
