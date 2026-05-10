; DESCRIPTION: Composite: Draws a black circle centered at (301, 62) with radius 54 then Places a magenta line segment connecting (146, 75) to (15, 108).
; PLAN: r0=301(x), r1=62(y), r2=54(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=146(x1), r6=75(y1), r7=15(x2), r8=108(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 301
LDI r1, 62
LDI r2, 54
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 146
LDI r6, 75
LDI r7, 15
LDI r8, 108
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
