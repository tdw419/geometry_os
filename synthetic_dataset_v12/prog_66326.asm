; DESCRIPTION: Composite: Places a green dot at position (220, 7) then Draws a black line from (82, 119) to (409, 193) then Draws a cyan circle centered at (386, 198) with radius 44.
; PLAN: r0=220(x), r1=7(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=82(x1), r6=119(y1), r7=409(x2), r8=193(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=386(x), r11=198(y), r12=44(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 220
LDI r1, 7
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 82
LDI r6, 119
LDI r7, 409
LDI r8, 193
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 386
LDI r11, 198
LDI r12, 44
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
