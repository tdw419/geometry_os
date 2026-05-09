; DESCRIPTION: Composite: Draws a green line from (483, 236) to (249, 240) then Draws a red circle centered at (223, 108) with radius 63.
; PLAN: r0=483(x1), r1=236(y1), r2=249(x2), r3=240(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=223(x), r6=108(y), r7=63(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 483
LDI r1, 236
LDI r2, 249
LDI r3, 240
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 223
LDI r6, 108
LDI r7, 63
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
