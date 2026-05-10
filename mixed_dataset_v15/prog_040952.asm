; DESCRIPTION: Composite: Places a magenta line segment connecting (267, 54) to (139, 103) then Renders a black box of size 20x37 starting at (314, 76).
; PLAN: r0=267(x1), r1=54(y1), r2=139(x2), r3=103(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=314(x), r6=76(y), r7=20(width), r8=37(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 267
LDI r1, 54
LDI r2, 139
LDI r3, 103
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 314
LDI r6, 76
LDI r7, 20
LDI r8, 37
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
