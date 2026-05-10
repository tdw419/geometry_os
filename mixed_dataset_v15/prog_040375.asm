; DESCRIPTION: Composite: Places a black circle of radius 70 at center (355, 164) then Draws a yellow line from (26, 21) to (452, 194).
; PLAN: r0=355(x), r1=164(y), r2=70(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=26(x1), r6=21(y1), r7=452(x2), r8=194(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 355
LDI r1, 164
LDI r2, 70
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 26
LDI r6, 21
LDI r7, 452
LDI r8, 194
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
