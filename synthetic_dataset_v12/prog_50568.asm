; DESCRIPTION: Composite: Places a green circle of radius 25 at center (270, 158) then Draws a yellow line from (450, 189) to (39, 142) then Places a magenta dot at position (418, 13).
; PLAN: r0=270(x), r1=158(y), r2=25(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=450(x1), r6=189(y1), r7=39(x2), r8=142(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=418(x), r11=13(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 270
LDI r1, 158
LDI r2, 25
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 450
LDI r6, 189
LDI r7, 39
LDI r8, 142
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 418
LDI r11, 13
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
