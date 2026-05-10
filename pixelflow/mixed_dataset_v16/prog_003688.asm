; DESCRIPTION: Composite: Draws a green circle centered at (113, 141) with radius 63 then Places a magenta dot at position (25, 114) then Renders a red line between points (505, 56) and (396, 163).
; PLAN: r0=113(x), r1=141(y), r2=63(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=25(x), r6=114(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=505(x1), r11=56(y1), r12=396(x2), r13=163(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 113
LDI r1, 141
LDI r2, 63
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 25
LDI r6, 114
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 505
LDI r11, 56
LDI r12, 396
LDI r13, 163
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
