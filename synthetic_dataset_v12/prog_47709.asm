; DESCRIPTION: Composite: Draws a blue circle centered at (468, 194) with radius 39 then Renders a green line between points (304, 161) and (190, 158) then Places a orange dot at position (197, 186).
; PLAN: r0=468(x), r1=194(y), r2=39(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=304(x1), r6=161(y1), r7=190(x2), r8=158(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=197(x), r11=186(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 468
LDI r1, 194
LDI r2, 39
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 304
LDI r6, 161
LDI r7, 190
LDI r8, 158
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 197
LDI r11, 186
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
