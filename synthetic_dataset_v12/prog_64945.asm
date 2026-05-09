; DESCRIPTION: Composite: Draws a magenta circle centered at (447, 178) with radius 59 then Places a white dot at position (36, 135) then Renders a red line between points (487, 148) and (487, 197).
; PLAN: r0=447(x), r1=178(y), r2=59(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=36(x), r6=135(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=487(x1), r11=148(y1), r12=487(x2), r13=197(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 447
LDI r1, 178
LDI r2, 59
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 36
LDI r6, 135
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 487
LDI r11, 148
LDI r12, 487
LDI r13, 197
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
