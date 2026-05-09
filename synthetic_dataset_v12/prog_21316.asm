; DESCRIPTION: Composite: Draws a red line from (18, 255) to (464, 10) then Places a yellow dot at position (85, 75) then Places a red circle of radius 35 at center (377, 176).
; PLAN: r0=18(x1), r1=255(y1), r2=464(x2), r3=10(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=85(x), r6=75(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=377(x), r11=176(y), r12=35(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 18
LDI r1, 255
LDI r2, 464
LDI r3, 10
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 85
LDI r6, 75
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 377
LDI r11, 176
LDI r12, 35
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
