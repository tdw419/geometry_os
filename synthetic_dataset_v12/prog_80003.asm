; DESCRIPTION: Composite: Draws a blue circle centered at (260, 132) with radius 54 then Renders a red line between points (69, 245) and (72, 14) then Places a green dot at position (383, 223).
; PLAN: r0=260(x), r1=132(y), r2=54(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=69(x1), r6=245(y1), r7=72(x2), r8=14(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=383(x), r11=223(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 260
LDI r1, 132
LDI r2, 54
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 69
LDI r6, 245
LDI r7, 72
LDI r8, 14
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 383
LDI r11, 223
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
