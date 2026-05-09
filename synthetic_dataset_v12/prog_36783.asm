; DESCRIPTION: Composite: Draws a yellow line from (223, 54) to (84, 76) then Places a red circle of radius 77 at center (384, 84) then Places a magenta dot at position (181, 227).
; PLAN: r0=223(x1), r1=54(y1), r2=84(x2), r3=76(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=384(x), r6=84(y), r7=77(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=181(x), r11=227(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 223
LDI r1, 54
LDI r2, 84
LDI r3, 76
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 384
LDI r6, 84
LDI r7, 77
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 181
LDI r11, 227
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
