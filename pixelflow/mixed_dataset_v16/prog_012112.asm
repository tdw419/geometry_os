; DESCRIPTION: Composite: Draws a white line from (250, 240) to (248, 177) then Draws a magenta rectangle at (467, 23) with width 44 and height 42.
; PLAN: r0=250(x1), r1=240(y1), r2=248(x2), r3=177(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=467(x), r6=23(y), r7=44(width), r8=42(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 250
LDI r1, 240
LDI r2, 248
LDI r3, 177
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 467
LDI r6, 23
LDI r7, 44
LDI r8, 42
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
