; DESCRIPTION: Composite: Places a green line segment connecting (417, 233) to (220, 198) then Places a white dot at position (243, 226) then Draws a cyan circle centered at (144, 101) with radius 72.
; PLAN: r0=417(x1), r1=233(y1), r2=220(x2), r3=198(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=243(x), r6=226(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=144(x), r11=101(y), r12=72(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 417
LDI r1, 233
LDI r2, 220
LDI r3, 198
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 243
LDI r6, 226
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 144
LDI r11, 101
LDI r12, 72
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
