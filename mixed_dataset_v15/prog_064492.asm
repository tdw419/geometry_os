; DESCRIPTION: Composite: Places a yellow dot at position (140, 131) then Draws a magenta circle centered at (153, 48) with radius 19 then Places a magenta line segment connecting (295, 106) to (213, 182).
; PLAN: r0=140(x), r1=131(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=153(x), r6=48(y), r7=19(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=295(x1), r11=106(y1), r12=213(x2), r13=182(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 140
LDI r1, 131
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 153
LDI r6, 48
LDI r7, 19
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 295
LDI r11, 106
LDI r12, 213
LDI r13, 182
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
