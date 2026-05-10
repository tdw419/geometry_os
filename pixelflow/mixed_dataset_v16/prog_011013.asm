; DESCRIPTION: Composite: Places a magenta dot at position (168, 52) then Places a blue circle of radius 43 at center (290, 119) then Draws a black line from (96, 189) to (455, 117).
; PLAN: r0=168(x), r1=52(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=290(x), r6=119(y), r7=43(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=96(x1), r11=189(y1), r12=455(x2), r13=117(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 168
LDI r1, 52
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 290
LDI r6, 119
LDI r7, 43
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 96
LDI r11, 189
LDI r12, 455
LDI r13, 117
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
