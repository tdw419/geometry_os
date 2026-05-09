; DESCRIPTION: Composite: Draws a magenta line from (471, 116) to (379, 137) then Draws a cyan circle centered at (301, 97) with radius 80 then Places a green dot at position (148, 205).
; PLAN: r0=471(x1), r1=116(y1), r2=379(x2), r3=137(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=301(x), r6=97(y), r7=80(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=148(x), r11=205(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 471
LDI r1, 116
LDI r2, 379
LDI r3, 137
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 301
LDI r6, 97
LDI r7, 80
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 148
LDI r11, 205
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
