; DESCRIPTION: Composite: Places a green line segment connecting (428, 195) to (115, 56) then Draws a green rectangle at (207, 154) with width 54 and height 82.
; PLAN: r0=428(x1), r1=195(y1), r2=115(x2), r3=56(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=207(x), r6=154(y), r7=54(width), r8=82(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 428
LDI r1, 195
LDI r2, 115
LDI r3, 56
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 207
LDI r6, 154
LDI r7, 54
LDI r8, 82
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
