; DESCRIPTION: Composite: Draws a black line from (263, 160) to (481, 44) then Draws a green circle centered at (142, 133) with radius 72 then Places a red dot at position (84, 21).
; PLAN: r0=263(x1), r1=160(y1), r2=481(x2), r3=44(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=142(x), r6=133(y), r7=72(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=84(x), r11=21(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 263
LDI r1, 160
LDI r2, 481
LDI r3, 44
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 142
LDI r6, 133
LDI r7, 72
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 84
LDI r11, 21
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
