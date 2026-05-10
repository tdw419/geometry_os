; DESCRIPTION: Composite: Renders a red line between points (146, 221) and (196, 211) then Places a red dot at position (200, 37) then Draws a yellow circle centered at (461, 216) with radius 16.
; PLAN: r0=146(x1), r1=221(y1), r2=196(x2), r3=211(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=200(x), r6=37(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=461(x), r11=216(y), r12=16(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 146
LDI r1, 221
LDI r2, 196
LDI r3, 211
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 200
LDI r6, 37
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 461
LDI r11, 216
LDI r12, 16
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
