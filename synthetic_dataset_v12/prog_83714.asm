; DESCRIPTION: Composite: Renders a blue disk with center (199, 187) and radius 68 then Draws a yellow line from (14, 225) to (395, 70) then Places a magenta dot at position (327, 122).
; PLAN: r0=199(x), r1=187(y), r2=68(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=14(x1), r6=225(y1), r7=395(x2), r8=70(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=327(x), r11=122(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 199
LDI r1, 187
LDI r2, 68
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 14
LDI r6, 225
LDI r7, 395
LDI r8, 70
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 327
LDI r11, 122
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
