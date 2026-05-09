; DESCRIPTION: Composite: Places a cyan line segment connecting (510, 231) to (184, 108) then Places a green dot at position (394, 109) then Draws a purple circle centered at (267, 75) with radius 16.
; PLAN: r0=510(x1), r1=231(y1), r2=184(x2), r3=108(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=394(x), r6=109(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=267(x), r11=75(y), r12=16(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 510
LDI r1, 231
LDI r2, 184
LDI r3, 108
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 394
LDI r6, 109
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 267
LDI r11, 75
LDI r12, 16
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
