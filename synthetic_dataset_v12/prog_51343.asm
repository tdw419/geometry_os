; DESCRIPTION: Composite: Draws a magenta line from (0, 197) to (366, 186) then Renders a green disk with center (261, 106) and radius 48 then Places a white dot at position (430, 29).
; PLAN: r0=0(x1), r1=197(y1), r2=366(x2), r3=186(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=261(x), r6=106(y), r7=48(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=430(x), r11=29(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 0
LDI r1, 197
LDI r2, 366
LDI r3, 186
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 261
LDI r6, 106
LDI r7, 48
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 430
LDI r11, 29
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
