; DESCRIPTION: Composite: Places a magenta line segment connecting (453, 156) to (354, 108) then Draws a green rectangle at (71, 68) with width 58 and height 52.
; PLAN: r0=453(x1), r1=156(y1), r2=354(x2), r3=108(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=71(x), r6=68(y), r7=58(width), r8=52(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 453
LDI r1, 156
LDI r2, 354
LDI r3, 108
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 71
LDI r6, 68
LDI r7, 58
LDI r8, 52
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
