; DESCRIPTION: Composite: Sets a single white pixel at (35, 50) then Draws a cyan line from (132, 26) to (12, 188) then Creates a red circular shape at (451, 107) with radius 48.
; PLAN: r0=35(x), r1=50(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=132(x1), r6=26(y1), r7=12(x2), r8=188(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=451(x), r11=107(y), r12=48(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 35
LDI r1, 50
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 132
LDI r6, 26
LDI r7, 12
LDI r8, 188
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 451
LDI r11, 107
LDI r12, 48
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
