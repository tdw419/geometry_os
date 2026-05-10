; DESCRIPTION: Composite: Draws a magenta line from (489, 49) to (161, 196) then Places a magenta dot at position (469, 209) then Renders a white disk with center (243, 94) and radius 22.
; PLAN: r0=489(x1), r1=49(y1), r2=161(x2), r3=196(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=469(x), r6=209(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=243(x), r11=94(y), r12=22(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 489
LDI r1, 49
LDI r2, 161
LDI r3, 196
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 469
LDI r6, 209
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 243
LDI r11, 94
LDI r12, 22
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
