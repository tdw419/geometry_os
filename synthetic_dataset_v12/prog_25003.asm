; DESCRIPTION: Composite: Places a yellow line segment connecting (497, 18) to (12, 201) then Places a green 41x100 rectangle at position (216, 17).
; PLAN: r0=497(x1), r1=18(y1), r2=12(x2), r3=201(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=216(x), r6=17(y), r7=41(width), r8=100(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 497
LDI r1, 18
LDI r2, 12
LDI r3, 201
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 216
LDI r6, 17
LDI r7, 41
LDI r8, 100
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
