; DESCRIPTION: Composite: Creates a cyan circular shape at (133, 117) with radius 42 then Draws a cyan line from (250, 156) to (489, 33).
; PLAN: r0=133(x), r1=117(y), r2=42(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=250(x1), r6=156(y1), r7=489(x2), r8=33(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 133
LDI r1, 117
LDI r2, 42
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 250
LDI r6, 156
LDI r7, 489
LDI r8, 33
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
