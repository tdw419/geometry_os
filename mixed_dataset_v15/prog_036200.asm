; DESCRIPTION: Composite: Places a yellow dot at position (237, 77) then Draws a yellow circle centered at (214, 57) with radius 27 then Draws a magenta line from (451, 85) to (376, 76).
; PLAN: r0=237(x), r1=77(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=214(x), r6=57(y), r7=27(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=451(x1), r11=85(y1), r12=376(x2), r13=76(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 237
LDI r1, 77
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 214
LDI r6, 57
LDI r7, 27
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 451
LDI r11, 85
LDI r12, 376
LDI r13, 76
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
