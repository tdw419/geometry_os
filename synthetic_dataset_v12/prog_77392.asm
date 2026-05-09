; DESCRIPTION: Composite: Draws a green line from (201, 36) to (170, 15) then Draws a red circle centered at (366, 129) with radius 42.
; PLAN: r0=201(x1), r1=36(y1), r2=170(x2), r3=15(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=366(x), r6=129(y), r7=42(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 201
LDI r1, 36
LDI r2, 170
LDI r3, 15
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 366
LDI r6, 129
LDI r7, 42
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
