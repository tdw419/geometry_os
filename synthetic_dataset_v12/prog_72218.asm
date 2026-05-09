; DESCRIPTION: Composite: Places a red circle of radius 72 at center (165, 88) then Draws a yellow line from (156, 179) to (497, 171).
; PLAN: r0=165(x), r1=88(y), r2=72(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=156(x1), r6=179(y1), r7=497(x2), r8=171(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 165
LDI r1, 88
LDI r2, 72
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 156
LDI r6, 179
LDI r7, 497
LDI r8, 171
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
