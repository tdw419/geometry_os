; DESCRIPTION: Composite: Places a orange dot at position (481, 134) then Draws a green circle centered at (263, 210) with radius 36 then Renders a blue line between points (358, 13) and (34, 135).
; PLAN: r0=481(x), r1=134(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=263(x), r6=210(y), r7=36(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=358(x1), r11=13(y1), r12=34(x2), r13=135(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 481
LDI r1, 134
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 263
LDI r6, 210
LDI r7, 36
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 358
LDI r11, 13
LDI r12, 34
LDI r13, 135
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
