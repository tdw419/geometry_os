; DESCRIPTION: Composite: Draws a green line from (311, 33) to (369, 44) then Draws a black circle centered at (212, 90) with radius 49 then Sets a single cyan pixel at (284, 142).
; PLAN: r0=311(x1), r1=33(y1), r2=369(x2), r3=44(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=212(x), r6=90(y), r7=49(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=284(x), r11=142(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 311
LDI r1, 33
LDI r2, 369
LDI r3, 44
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 212
LDI r6, 90
LDI r7, 49
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 284
LDI r11, 142
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
