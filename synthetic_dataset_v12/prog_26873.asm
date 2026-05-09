; DESCRIPTION: Composite: Sets a single yellow pixel at (299, 205) then Draws a green line from (461, 9) to (36, 150) then Places a magenta circle of radius 62 at center (419, 97).
; PLAN: r0=299(x), r1=205(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=461(x1), r6=9(y1), r7=36(x2), r8=150(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=419(x), r11=97(y), r12=62(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 299
LDI r1, 205
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 461
LDI r6, 9
LDI r7, 36
LDI r8, 150
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 419
LDI r11, 97
LDI r12, 62
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
