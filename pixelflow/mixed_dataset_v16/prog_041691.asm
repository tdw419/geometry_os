; DESCRIPTION: Composite: Draws a orange line from (211, 249) to (145, 204) then Draws a cyan circle centered at (271, 85) with radius 53 then Places a green dot at position (110, 205).
; PLAN: r0=211(x1), r1=249(y1), r2=145(x2), r3=204(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=271(x), r6=85(y), r7=53(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=110(x), r11=205(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 211
LDI r1, 249
LDI r2, 145
LDI r3, 204
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 271
LDI r6, 85
LDI r7, 53
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 110
LDI r11, 205
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
